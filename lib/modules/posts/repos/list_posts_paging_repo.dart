import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/resource/paging_repo.dart';

class ListPostPagingRepo with PagingRepo<Post> {
  @override
  Post parseJSON(Map<String, dynamic> json) {
    return Post.fromJson(json);
  }

  @override
  String get url => '/posts';
}
