import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/providers/api_provider.dart';

class PostDetailRepo {
  final apiProvider = ApiProvider();

  Future<Post?> getPost(String id) async {
    try {
      final res = await apiProvider.get("/posts/$id");

      if (res.statusCode != 200) {
        return null;
      }

      Map<String, dynamic> data = res.data['data'];
      return Post.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
