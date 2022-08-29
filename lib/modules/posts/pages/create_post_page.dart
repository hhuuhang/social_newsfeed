import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_newsfeed/common/widgets/stateful/upload/manage_group/upload_group_value.dart';
import 'package:social_newsfeed/common/widgets/stateful/upload/widgets/image_upload_group.dart';
import 'package:social_newsfeed/common/widgets/stateful/upload/widgets/image_upload_item.dart';
import 'package:social_newsfeed/common/widgets/stateless/loading_hide_keyboard.dart';
import 'package:social_newsfeed/modules/posts/blocs/create_post_bloc.dart';
import 'package:social_newsfeed/themes/app_colors.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late final TextEditingController _desCtrl;
  late final FocusNode _focusNodeDes;
  bool isLoading = false;

  UploadGroupValue _currentGroupUploadValue =
      const UploadGroupValue(<ImageUploadItem>[]);

  final _createPostBloc = CreatePostBloc();

  @override
  void initState() {
    super.initState();

    _desCtrl = TextEditingController();
    _focusNodeDes = FocusNode();
  }

  @override
  void dispose() {
    _desCtrl.dispose();
    _focusNodeDes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Create New Post'),
      ),
      body: LoadingHideKeyboard(
        isLoading: isLoading,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        controller: _desCtrl,
                        focusNode: _focusNodeDes,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type description here...',
                          filled: true,
                        ),
                        autocorrect: false,
                        minLines: 5,
                        maxLines: 15,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(300),
                        ],
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ImageUploadGroup(
                      isFullGrid: false,
                      onValueChanged: (UploadGroupValue value) {
                        setState(() {
                          _currentGroupUploadValue = value;
                        });
                      },
                      listImages: const [],
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: buildButtonUpload(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonUpload() {
    final state = _currentGroupUploadValue.state;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.backgroundColor,
        ),
        onPressed: state == UploadGroupState.uploading ? null : createPost,
        child: const Text('Create Post'),
      ),
    );
  }

  void createPost() async {
    try {
      final res = await _createPostBloc.createPost(
          _desCtrl.text, _currentGroupUploadValue.uploadedIds);

      if (res) {
        Navigator.pop(context);
        return;
      }

      // show popup error
    } catch (e) {}
  }
}
