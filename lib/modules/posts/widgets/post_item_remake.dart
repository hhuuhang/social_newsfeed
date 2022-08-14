import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/widgets/stateless/item_row.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/widgets/action_post.dart';
import 'package:social_newsfeed/modules/posts/widgets/grid_image.dart';
import 'package:social_newsfeed/route/route_name.dart';

class PostItemRemake extends StatelessWidget {
  final Post post;

  const PostItemRemake({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: GestureDetector(
        onTap: () => _navigateToPostDetailPage(context),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: ItemRow(
                    avatarUrl: post.urlUserAvatar,
                    title: post.displayName,
                    subtitle: 'Time created',
                    // onTap: () => navigateToProfilePage(context, post.user),
                  ),
                ),
                GridImage(photos: post.photos ?? []),
                ActionPost(post: post),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPostDetailPage(BuildContext context) {
    Navigator.pushNamed(context, RouteName.postDetailPage, arguments: post);
  }
}
