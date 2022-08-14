import 'dart:async';

import 'package:social_newsfeed/blocs/app_event_bloc.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/repos/post_detail_repo.dart';
import 'package:social_newsfeed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class PostDetailBloc extends BlocBase {
  final String _postId;

  final _postCtrl = BehaviorSubject<Post>();
  Stream<Post> get postsStream => _postCtrl.stream;

  PostDetailBloc(this._postId);

  Future<void> getPost() async {
    try {
      final res = await PostDetailRepo().getPost(_postId);
      if (res != null) {
        _postCtrl.sink.add(res);
      }
    } catch (e) {
      _postCtrl.sink.addError('Cannot fetch post right now!!!');
    }
  }

  @override
  void dispose() {
    _postCtrl.close();
  }
}
