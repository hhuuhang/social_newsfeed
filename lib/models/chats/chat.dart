import 'package:json_annotation/json_annotation.dart';
import 'package:social_newsfeed/models/users/user.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'chat.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Chat {
  Chat(this.id, this.text, this.user, this.createdAt, this.replyCount,
      this.unreadCount);

  final String id;
  final String text;
  final User user;
  @JsonKey(name: 'reply_count')
  final int replyCount;
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Chats {
  Chats(this.results);
  final List<Chat> results;
  factory Chats.fromJson(Map<String, dynamic> json) => _$ChatsFromJson(json);
}
