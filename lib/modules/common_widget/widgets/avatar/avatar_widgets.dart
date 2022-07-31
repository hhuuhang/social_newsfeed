import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/data_type/user_status.dart';
import 'package:social_newsfeed/themes/app_colors.dart';
import 'package:social_newsfeed/themes/app_styles.dart';

//avatar with active status and name

class AvatarWithNameAndActiveStatus extends StatefulWidget {
  const AvatarWithNameAndActiveStatus(
      {Key? key,
      required this.picture,
      required this.nameOfUser,
      this.userStatus})
      : super(key: key);
  final String picture;
  final String nameOfUser;
  final UserStatus? userStatus;
  @override
  State<AvatarWithNameAndActiveStatus> createState() =>
      _AvatarWithNameAndActiveStatusState();
}

class _AvatarWithNameAndActiveStatusState
    extends State<AvatarWithNameAndActiveStatus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.userStatus == UserStatus.online
              ? AvatarWithActiveStatus(picture: widget.picture)
              : Avatar(picture: widget.picture),
          Text(
            widget.nameOfUser,
            style:
                AppTextStyles.caption11.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

//avatar with active Status
class AvatarWithActiveStatus extends StatefulWidget {
  const AvatarWithActiveStatus({Key? key, required this.picture})
      : super(key: key);
  final String picture;
  @override
  State<AvatarWithActiveStatus> createState() => _AvatarWithActiveStatus();
}

class _AvatarWithActiveStatus extends State<AvatarWithActiveStatus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(children: [
        Avatar(picture: widget.picture),
        const Positioned(top: 48, left: 43, child: ActiveStatusGreen())
      ]),
    );
  }
}

//avatar just Image
class Avatar extends StatefulWidget {
  const Avatar({Key? key, required this.picture}) : super(key: key);
  final String picture;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.picture),
      ),
    );
  }
}

//avatar just Image and Custom Size
class AvatarCustomSize extends StatefulWidget {
  const AvatarCustomSize(
      {Key? key,
      required this.picture,
      required this.width,
      required this.height})
      : super(key: key);
  final String picture;
  final double width;
  final double height;
  @override
  AvatarCustomSizeState createState() => AvatarCustomSizeState();
}

class AvatarCustomSizeState extends State<AvatarCustomSize> {
  get height => null;

  get width => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.picture),
      ),
    );
  }
}

class ActiveStatusGreen extends StatelessWidget {
  const ActiveStatusGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.light),
          color: AppColors.activeStateGreen,
          shape: BoxShape.circle),
    );
  }
}
