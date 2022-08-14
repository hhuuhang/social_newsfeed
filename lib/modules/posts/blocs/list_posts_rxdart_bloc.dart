import 'dart:async';

import 'package:social_newsfeed/blocs/app_event_bloc.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/repos/list_posts_paging_repo.dart';
import 'package:social_newsfeed/modules/posts/repos/list_posts_repo.dart';
import 'package:social_newsfeed/providers/bloc_provider.dart';
import 'package:social_newsfeed/resource/paging_data_bloc.dart';
import 'package:social_newsfeed/resource/paging_repo.dart';
import 'package:rxdart/rxdart.dart';

// class ListPostsRxDartBloc extends BlocBase{
//   final _postsCtrl = BehaviorSubject<List<Post>?>.seeded(const []);
//   Stream<List<Post>?> get postsStream => _postsCtrl.stream;

//   Future<void> getPosts() async {
//     try {
//       final res = await ListPostsRepo().getPosts();
//       if (res != null) {
//         _postsCtrl.sink.add(res);
//       }
//     } catch (e) {
//       _postsCtrl.sink.addError('Cannot fetch list posts right now!!!');
//     }
//   }

//   @override
//   void dispose() {
//     _postsCtrl.close();
//   }
// }

class ListPostsRxDartBloc extends PagingDataBehaviorBloc<Post> {
  Stream<List<Post>?> get postsStream => dataStream;

  late final StreamSubscription<BlocEvent> _onLikeAndUnLikePostSub;
  late final StreamSubscription<BlocEvent> _onCreatePostSub;

  final ListPostPagingRepo _repo;

  ListPostsRxDartBloc() : _repo = ListPostPagingRepo() {
    _onLikeAndUnLikePostSub = AppEventBloc().listenManyEvents(
      listEventName: [
        EventName.likePostDetail,
        EventName.unLikePostDetail,
      ],
      handler: _onLikeAndUnlikePost,
    );
    _onCreatePostSub = AppEventBloc().listenEvent(
      eventName: EventName.createPost,
      handler: _onCreatePost,
    );
  }

  Future<void> getPosts() async {
    return getData();
  }

  void _onCreatePost(BlocEvent evt) {
    refresh();
  }

  void _onLikeAndUnlikePost(BlocEvent evt) {
    print('_onLikeAndUnlikePost ${evt.name}');
    final oldPosts = dataValue ?? [];

    final index = oldPosts.indexWhere((p) => p.id == evt.value);

    if (index == -1) {
      return;
    }

    final post = oldPosts[index];

    final likeCount = post.likeCounts;
    final eventIsLike = [EventName.likePostDetail].contains(evt.name);
    final likeCountNew = eventIsLike ? likeCount! + 1 : likeCount! - 1;

    post
      ..likeCounts = likeCountNew
      ..liked = eventIsLike;

    oldPosts[index] = post;

    dataSubject.sink.add(oldPosts.toList());
  }

  @override
  void dispose() {
    _onLikeAndUnLikePostSub.cancel();
    _onCreatePostSub.cancel();
  }

  @override
  PagingRepo get dataRepo => _repo;
}
