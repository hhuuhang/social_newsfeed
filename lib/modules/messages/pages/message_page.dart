import 'package:flutter/material.dart';
import 'package:social_newsfeed/models/chats/chat.dart';
import 'package:social_newsfeed/models/users/user.dart';
import 'package:social_newsfeed/modules/messages/repos/call_api_message.dart';
import 'package:social_newsfeed/modules/messages/widgets/messages_widget.dart';
import 'package:social_newsfeed/themes/app_colors.dart';
import 'package:social_newsfeed/themes/app_styles.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
    // final test = data.;
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        backgroundColor: AppColors.dark,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          // add more IconButton
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
                  'Messages',
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
            future: Future.wait([users]),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                final dataUsers = snapshot.data![0];
                // return AvatarWithNameAndActiveStatus(
                //   picture: data![0][0].picture.large,
                //   nameOfUser: data[0][0].name,
                // );
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: HorizontalListActiveUser(dataUsers: dataUsers),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
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
