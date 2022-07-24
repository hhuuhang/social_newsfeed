import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';

@JsonSerializable()
class Picture {
  Picture(this.large, this.medium, this.thumbnail);

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}
