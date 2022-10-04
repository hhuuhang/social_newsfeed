import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/posts/models/photo.dart';
import 'package:social_newsfeed/modules/posts/widgets/post_img_item.dart';
import 'package:social_newsfeed/utils/photo_utils.dart';

class GridImage extends StatelessWidget {
  final List<Photo> photos;
  final double padding;

  const GridImage({
    Key? key,
    required this.photos,
    this.padding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - padding;
    return buildImageGrid(photos, width, context);
  }

  Widget buildImageGrid(
      List<Photo> photos, double width, BuildContext context) {
    switch (photos.length) {
      case 0:
        return const SizedBox();
      case 1:
        return _buildOneImage(photos[0], width, context);
      case 2:
        return _buildTwoImage(photos, width, context);
      case 3:
        return _buildThreeImage(photos, width, context);
      case 4:
        return _buildFourImage(photos, width, context);

      default:
        return _buildMoreImage(photos, width, photos.length, context);
    }
  }

  Widget _buildOneImage(Photo photo, double width, BuildContext context) {
    final image = photo.image;
    final heightView =
        PhotoUtils.getHeightView(width, image!.orgWidth!, image.orgHeight!);
    final url =
        PhotoUtils.genImgIx(image.url, width.toInt(), heightView.toInt());

    // print('url $url');

    // magic logic
    if (heightView >= width * 3) {
      return GestureDetector(
        onTap: () => navigateToPhotoPage([photo], 0, context),
        child: SizedBox(
          height: width * 2,
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => navigateToPhotoPage([photo], 0, context),
      child: SizedBox(
        height: heightView,
        width: width,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTwoImage(
      List<Photo> photos, double width, BuildContext context) {
    final firstImg = photos[0].image;

    // 2 tam cung dung
    // 2 tam cung ngang
    // xet dua tren tam dau tien
    // + 1: tam dau tien dung
    // + 2: tam dau tien ngang

    if (firstImg!.orgWidth! > firstImg.orgHeight!) {
      final height = width - padding;
      return SizedBox(
        height: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PostImgItem(
              url: photos[0].url,
              width: width,
              height: height / 2,
              onTap: () => navigateToPhotoPage(photos, 0, context),
            ),
            _buildPadding(),
            PostImgItem(
              url: photos[1].url,
              width: width,
              height: height / 2,
              onTap: () => navigateToPhotoPage(photos, 0, context),
            ),
          ],
        ),
      );
    }

    final height = width;
    width = width - padding;
    return Row(
      children: <Widget>[
        PostImgItem(
          url: photos[0].url,
          width: width / 2,
          height: height,
          onTap: () => navigateToPhotoPage(photos, 0, context),
        ),
        _buildPadding(),
        PostImgItem(
          url: photos[1].url,
          width: width / 2,
          height: height,
          onTap: () => navigateToPhotoPage(photos, 0, context),
        ),
      ],
    );
  }

  Padding _buildPadding() => Padding(
        padding: EdgeInsets.only(left: padding, top: padding),
      );

  Widget _buildThreeImage(
      List<Photo> photos, double width, BuildContext context) {
    final firstImg = photos[0].image;

    // first vertical style images
    if (firstImg!.orgHeight! > firstImg.orgWidth!) {
      final height = width;
      final itemHeight = height;
      final itemWidth = width - padding;
      return SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PostImgItem(
              url: photos[0].url,
              width: itemWidth / 2,
              height: itemHeight,
              onTap: () => navigateToPhotoPage(photos, 0, context),
            ),
            _buildPadding(),
            Column(
              children: <Widget>[
                PostImgItem(
                  url: photos[1].url,
                  width: itemWidth / 2,
                  height: (itemHeight - padding) / 2,
                  onTap: () => navigateToPhotoPage(photos, 1, context),
                ),
                _buildPadding(),
                PostImgItem(
                  url: photos[2].url,
                  width: itemWidth / 2,
                  height: (itemHeight - padding) / 2,
                  onTap: () => navigateToPhotoPage(photos, 2, context),
                ),
              ],
            )
          ],
        ),
      );
    }

    final height = width;
    final itemWidth = (width - padding) / 2;
    final itemHeight = (height - padding) / 2;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              PostImgItem(
                url: photos[1].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 1, context),
              ),
              _buildPadding(),
              PostImgItem(
                url: photos[2].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 2, context),
              ),
            ],
          ),
          _buildPadding(),
          PostImgItem(
            url: photos[0].url,
            width: width,
            height: itemHeight,
            onTap: () => navigateToPhotoPage(photos, 0, context),
          ),
        ],
      ),
    );
  }

  Widget _buildFourImage(
      List<Photo> photos, double width, BuildContext context) {
    final firstImg = photos[0].image;

    // first vertical style images
    if (firstImg!.orgHeight! > firstImg.orgWidth!) {
      final height = width;
      final itemHeight = height;
      final itemWidth = width - padding;
      return SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PostImgItem(
              url: photos[0].url,
              width: itemWidth * 2 / 3,
              height: itemHeight,
              onTap: () => navigateToPhotoPage(photos, 0, context),
            ),
            _buildPadding(),
            Column(
              children: <Widget>[
                PostImgItem(
                  url: photos[1].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 1, context),
                ),
                _buildPadding(),
                PostImgItem(
                  url: photos[2].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 2, context),
                ),
                _buildPadding(),
                PostImgItem(
                  url: photos[3].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 3, context),
                ),
              ],
            )
          ],
        ),
      );
    }

    final height = width;
    final itemWidth = (width - padding) / 3;
    final itemHeight = (height - padding) / 3;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PostImgItem(
            url: photos[0].url,
            width: width,
            height: itemHeight * 2,
            onTap: () => navigateToPhotoPage(photos, 0, context),
          ),
          _buildPadding(),
          Row(
            children: <Widget>[
              PostImgItem(
                url: photos[1].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 1, context),
              ),
              _buildPadding(),
              PostImgItem(
                url: photos[2].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 2, context),
              ),
              _buildPadding(),
              PostImgItem(
                url: photos[3].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 3, context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoreImage(
      List<Photo> photos, double width, int totalImg, BuildContext context) {
    final firstImg = photos[0].image;
    final moreNumber = totalImg - 4;

    // first vertical style images
    if (firstImg!.orgHeight! > firstImg.orgWidth!) {
      final height = width;
      final itemHeight = height;
      final itemWidth = width - padding;
      return SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PostImgItem(
              url: photos[0].url,
              width: itemWidth * 2 / 3,
              height: itemHeight,
              onTap: () => navigateToPhotoPage(photos, 0, context),
            ),
            _buildPadding(),
            Column(
              children: <Widget>[
                PostImgItem(
                  url: photos[1].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 1, context),
                ),
                _buildPadding(),
                PostImgItem(
                  url: photos[2].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 2, context),
                ),
                _buildPadding(),
                PostImgItem(
                  show: true,
                  moreNumber: moreNumber.toString(),
                  url: photos[3].url,
                  width: itemWidth / 3,
                  height: (itemHeight - padding) / 3,
                  onTap: () => navigateToPhotoPage(photos, 3, context),
                ),
              ],
            ),
          ],
        ),
      );
    }

    final height = width;
    final itemWidth = (width - padding) / 3;
    final itemHeight = (height - padding) / 3;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PostImgItem(
            url: photos[0].url,
            width: width,
            height: itemHeight * 2,
            onTap: () => navigateToPhotoPage(photos, 0, context),
          ),
          _buildPadding(),
          Row(
            children: <Widget>[
              PostImgItem(
                url: photos[1].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 1, context),
              ),
              _buildPadding(),
              PostImgItem(
                url: photos[2].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 2, context),
              ),
              _buildPadding(),
              PostImgItem(
                show: true,
                moreNumber: moreNumber.toString(),
                url: photos[3].url,
                width: itemWidth,
                height: itemHeight,
                onTap: () => navigateToPhotoPage(photos, 3, context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToPhotoPage(
      List<Photo> photos, int index, BuildContext context) {}
}
