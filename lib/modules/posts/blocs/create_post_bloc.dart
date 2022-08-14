import 'package:social_newsfeed/blocs/app_event_bloc.dart';
import 'package:social_newsfeed/modules/posts/repos/create_post_repo.dart';

class CreatePostBloc {
  Future<bool> createPost(String des, List<String> ids) async {
    try {
      final data = {"description": des, "img_upload_ids": ids};

      final res = await CreatePostRepo().postData(data);

      if (res) {
        AppEventBloc().emitEvent(const BlocEvent(EventName.createPost));
      }

      return res;
    } catch (e) {
      rethrow;
    }
  }
}
