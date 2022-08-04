import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:social_newsfeed/models/chats/chat.dart';
import 'package:social_newsfeed/models/users/user.dart';

Future<Users> readJsonFromAssetUsers() async {
  const assetKey = 'assets/mock/users.json';
  final json = await rootBundle.loadString(assetKey);
  final map = jsonDecode(json);
  print(map);
  print("-----------------------------------");

  final results = Users.fromJson(map);
  print(results);
  // final users = results.results;
  return results;
}

Future<Chats> readJsonFromAssetChats() async {
  const assetKey = 'assets/mock/chats.json';
  final json = await rootBundle.loadString(assetKey);
  final map = jsonDecode(json);

  final results = Chats.fromJson(map);
  // final users = results.results;
  return results;
}
