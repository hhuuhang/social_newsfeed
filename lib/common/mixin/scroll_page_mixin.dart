import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

mixin ScrollPageMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;

  void loadMoreData();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // print('extendAfter: ${scrollController.position.extentAfter} - extentBefore: ${scrollController.position.extentBefore}');
      if (scrollController.position.extentAfter < 500 &&
          scrollController.position.extentBefore > 100) {
        loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
