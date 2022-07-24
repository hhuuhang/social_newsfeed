// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      json['id'] as String,
      json['text'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['created_at'] as String,
      json['reply_count'] as int,
      json['unread_count'] as int,
    );

// Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
//       'id': instance.id,
//       'text': instance.text,
//       'user': instance.user,
//       'reply_count': instance.replyCount,
//       'unread_count': instance.unreadCount,
//       'created_at': instance.createdAt,
//     };

Chats _$ChatsFromJson(Map<String, dynamic> json) => Chats(
      (json['results'] as List<dynamic>)
          .map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

// Map<String, dynamic> _$ChatsToJson(Chats instance) => <String, dynamic>{
//       'results': instance.results,
//     };
