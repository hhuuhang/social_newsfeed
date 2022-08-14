import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/widgets/stateless/item_row.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';

class PostItemDemo extends StatelessWidget {
  final Post post;

  const PostItemDemo({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          ItemRow(),
        ],
      ),
    );
  }
}
