import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/avatar/avatar_widgets.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/primary_button.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/white_button.dart';
import 'package:social_newsfeed/modules/messages/widgets/messages_widget.dart';
// import 'package:social_newsfeed/modules/common_widget/widgets/messages/messages_widget.dart';

Map personInfor = {
  "id": "582fc99e-a955-446c-9d74-38574a75838b",
  "text": "People keep telling me \"orange\" but I still prefer \"pink\".",
  "user": {
    "gender": "male",
    "name": "Joseph Gordon",
    "email": "joseph.gordon@example.com",
    "dob": "1997-03-04T06:52:36.093Z",
    "registered": "2006-08-06T20:03:28.582Z",
    "phone": "061-796-7504",
    "status": "online",
    "picture": {
      "large": "https://randomuser.me/api/portraits/men/24.jpg",
      "medium": "https://randomuser.me/api/portraits/med/men/24.jpg",
      "thumbnail": "https://randomuser.me/api/portraits/thumb/men/24.jpg"
    }
  },
  "reply_count": 75,
  "unread_count": 2,
  "created_at": "2021-10-27T08:13:47.646Z"
};

class CommonWidgetPage extends StatefulWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);
  @override
  State<CommonWidgetPage> createState() => _CommonWidgetPageState();
}

class _CommonWidgetPageState extends State<CommonWidgetPage> {
  @override
  Widget build(BuildContext context) {
    //get size
    final Size size = MediaQuery.of(context).size;
    final double maxHeightScreen = size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Widget'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        height: maxHeightScreen,
        child: ListView(
          children: [
            AvatarWithActiveStatus(
                picture: personInfor["user"]["picture"]["large"]),
            const SizedBox(
              height: 20,
            ),
            AvatarWithNameAndActiveStatus(
              picture: personInfor["user"]["picture"]["large"],
              nameOfUser: personInfor["user"]["name"],
            ),
            const SizedBox(
              height: 20,
            ),
            AvatarWithMessageCard(
              picture: personInfor["user"]["picture"]["large"],
              nameOfUser: personInfor["user"]["name"],
              numOfMessageUnread: personInfor['unread_count'],
              lastMessage: personInfor["text"],
              timeOfLastMessage: personInfor["created_at"],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              content: "Primary Button",
              onClick: () {
                print("this is Primary button");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            WhiteButton(
              content: "White Button",
              onClick: () {
                print("this is White button");
              },
            ),
          ],
        ),
      ),
    );
  }
}
