import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_newsfeed/utils/photo_utils.dart';

class PostImgItem extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final int flex;
  final VoidCallback onTap;
  bool show;
  final String? moreNumber;

  PostImgItem({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.flex = 1,
    required this.onTap,
    this.show = false,
    this.moreNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                // imageUrl: url,
                imageUrl: PhotoUtils.genImgIx(
                  url,
                  width.toInt(),
                  height.toInt(),
                  focusFace: false,
                ),
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: show,
                child: Container(
                  color: const Color.fromARGB(193, 0, 0, 0),
                  child: Center(
                    child: Text(
                      "+$moreNumber",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
