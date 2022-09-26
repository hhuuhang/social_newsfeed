import 'package:social_newsfeed/models/user.dart';
import 'package:social_newsfeed/modules/posts/models/photo.dart';
import 'package:social_newsfeed/modules/posts/models/picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;

  @JsonKey(name: 'created_at', includeIfNull: false)
  final String? timeCreate;

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;

  @JsonKey(name: 'images', includeIfNull: false)
  final List<Picture>? images;

  @JsonKey(name: 'photos', includeIfNull: false)
  final List<Photo>? photos;

  @JsonKey(name: 'user', includeIfNull: false)
  final User? user; // user create post

  @JsonKey(name: 'comment_counts', includeIfNull: false)
  final int? commentCounts;

  @JsonKey(name: 'like_counts', includeIfNull: false)
  int? likeCounts;

  @JsonKey(name: 'liked', includeIfNull: false)
  bool? liked;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Post({
    this.id,
    this.status,
    this.timeCreate,
    this.title,
    this.description,
    this.images,
    this.photos,
    this.user,
    this.commentCounts,
    this.likeCounts,
    this.liked,
  });

  String? get urlUserAvatar => user?.imgUrl;

  String get displayName => user?.displayName ?? '';

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
