import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/posts/models/photo.dart';
import 'package:social_newsfeed/modules/posts/widgets/post_img_item.dart';
import 'package:social_newsfeed/utils/photo_utils.dart';

class ListImgDetail extends StatelessWidget {
  final List<Photo> photos;

  const ListImgDetail({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaxWidth = MediaQuery.of(context).size.width;
    final NumImg = photos.length;

    return Column(
      children: [
        for (var index = 0; index < NumImg; index++)
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: PhotoUtils.genImgIx(
                  photos[index].url,
                  MaxWidth.toInt(),
                  ((photos[index].image!.orgHeight!) * MaxWidth) ~/
                      photos[index].image!.orgWidth!,
                  focusFace: false,
                ),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
      ],
    );
  }
}
