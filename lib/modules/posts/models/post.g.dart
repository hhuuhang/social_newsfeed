// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      status: json['status'] as int?,
      timeCreate: json['created_at'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Picture.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      commentCounts: json['comment_counts'] as int?,
      likeCounts: json['like_counts'] as int?,
      liked: json['liked'] as bool?,
    );

Map<String, dynamic> _$PostToJson(Post instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('created_at', instance.timeCreate);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('images', instance.images);
  writeNotNull('photos', instance.photos);
  writeNotNull('user', instance.user);
  writeNotNull('comment_counts', instance.commentCounts);
  writeNotNull('like_counts', instance.likeCounts);
  writeNotNull('liked', instance.liked);
  return val;
}
