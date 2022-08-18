import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_newsfeed/models/chats/chat.dart';
import 'package:social_newsfeed/models/users/user.dart';
import 'package:social_newsfeed/modules/08_messages/repos/call_api_message.dart';
import 'package:social_newsfeed/modules/08_messages/widgets/messages_widget.dart';
import 'package:social_newsfeed/route/route_name.dart';
import 'package:social_newsfeed/themes/app_colors.dart';
import 'package:social_newsfeed/themes/app_styles.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late Future<Users> users;
  late Future<Chats> chats;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    users = readJsonFromAssetUsers();
    chats = readJsonFromAssetChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteName.DashboardPage);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 24),
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.largeTitle,
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: AppColors.black,
            // thickness: 0.5,
          ),
          FutureBuilder(
            future: Future.wait([chats]),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                final dataChats = snapshot.data![0];
                return VerticalListUserWithLastMessage(
                    dataUserWithLastChat: dataChats);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
