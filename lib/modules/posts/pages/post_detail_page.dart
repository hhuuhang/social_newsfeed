import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_newsfeed/common/widgets/stateless/item_row.dart';
import 'package:social_newsfeed/modules/posts/blocs/post_detail_bloc.dart';
import 'package:social_newsfeed/modules/posts/models/photo.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/widgets/action_post.dart';
import 'package:social_newsfeed/modules/posts/widgets/grid_image.dart';
import 'package:social_newsfeed/modules/posts/widgets/list_img_detail.dart';
import 'package:social_newsfeed/modules/posts/widgets/post_img_item.dart';
import 'package:social_newsfeed/providers/bloc_provider.dart';
import 'package:social_newsfeed/themes/app_colors.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  const PostDetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Post get post => widget.post;

  PostDetailBloc? get bloc => BlocProvider.of<PostDetailBloc>(context);

  late final TextEditingController txtCtrl;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    bloc!.getPost();

    txtCtrl = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    txtCtrl.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String? timeCreate = post.timeCreate;
    DateTime timeParse = DateTime.parse(timeCreate!);

    final DateFormat formatter = DateFormat('dd-MM-yyyy  H:m');
    final String formatted = formatter.format(timeParse);

    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: StreamBuilder<Post>(
            stream: bloc!.postsStream,
            initialData: widget.post,
            builder: (context, snapshot) {
              final post = snapshot.data;
              return Stack(
                children: [
                  CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: <Widget>[
                        const SliverAppBar(
                          backgroundColor: AppColors.backgroundColor,
                          title: Text('Post Detail Page'),
                          snap: true,
                          floating: true,
                          elevation: 1,
                          forceElevated: true,
                          // actions: [
                          //   IconButton(
                          //       onPressed: _writeCmt, icon: const Icon(Icons.add))
                          // ],
                        ),
                        CupertinoSliverRefreshControl(
                          onRefresh: bloc!.getPost,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 8),
                                child: ItemRow(
                                  avatarUrl: post!.urlUserAvatar,
                                  title: post.displayName,
                                  subtitle: formatted,
                                  onTap: () {},
                                ),
                              ),
                              if (post.photos != null)
                                // GridImage(photos: post.photos!, padding: 0),
                                ListImgDetail(
                                  photos: post.photos!,
                                ),
                              ActionPost(post: post),
                              const Divider(thickness: 1),
                            ],
                          ),
                        ),
                      ]),
                ],
              );
            }),
      ),
    );
  }
}
