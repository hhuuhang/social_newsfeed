import 'package:social_newsfeed/common/widgets/stateful/upload/widgets/image_upload_item.dart';
import 'package:social_newsfeed/modules/posts/models/picture.dart';

enum UploadGroupState { noPhoto, uploading, finished }

class UploadGroupValue {
  final List<ImageUploadItem> value;

  UploadGroupState get state {
    if (value.isEmpty) return UploadGroupState.noPhoto;

    if (value.where((img) => img.id == "").isEmpty) {
      return UploadGroupState.finished;
    }

    return UploadGroupState.uploading;
  }

  const UploadGroupValue(this.value);

  UploadGroupValue withValue(List<ImageUploadItem> value) {
    return UploadGroupValue(value);
  }

  List<String> get uploadedIds => value.map((e) => e.id).toList();

  List<Picture>? get uploadedPics => value.map((e) => e.picture!).toList();
}
