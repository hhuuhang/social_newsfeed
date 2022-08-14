import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/widgets/stateful/upload/manage_group/upload_group_value.dart';
import 'package:social_newsfeed/common/widgets/stateful/upload/widgets/image_upload_item.dart';

class UploadGroupStateController extends ValueNotifier<UploadGroupValue> {
  UploadGroupStateController()
      : super(const UploadGroupValue(<ImageUploadItem>[]));

  set state(UploadGroupValue state) {
    value = state;
  }
}
