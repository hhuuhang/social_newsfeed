import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/mixin/scroll_page_mixin.dart';
import 'package:social_newsfeed/common/widgets/stateless/activity_indicator.dart';
import 'package:social_newsfeed/modules/06_home_page/widgets/home_header.dart';
import 'package:social_newsfeed/modules/posts/blocs/list_posts_rxdart_bloc.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/widgets/post_item_remake.dart';
import 'package:social_newsfeed/route/route_name.dart';
import 'package:social_newsfeed/themes/app_colors.dart';

class ListPostsPagingRepo extends StatefulWidget {
  const ListPostsPagingRepo({Key? key}) : super(key: key);

  @override
  _ListPostsPagingRepoState createState() => _ListPostsPagingRepoState();
}

class _ListPostsPagingRepoState extends State<ListPostsPagingRepo>
    with ScrollPageMixin {
  final _postsBloc = ListPostsRxDartBloc();
  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _postsBloc.getPosts();
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, RouteName.createPostPage),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollCtrl,
        slivers: <Widget>[
          SliverAppBar(
            title: HomeHeader(),
            snap: true,
            floating: true,
            elevation: 1,
            forceElevated: true,
            backgroundColor: AppColors.backgroundColor,
            // actions: [
            //   IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
            // ],
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _postsBloc.refresh,
          ),
          StreamBuilder<List<Post>?>(
              stream: _postsBloc.postsStream,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const SliverFillRemaining(
                    child: ActivityIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const SliverFillRemaining(
                      child: Center(
                    child: Text('Something went wrong'),
                  ));
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = snapshot.data![index];
                      return PostItemRemake(post: post);
                    },
                    childCount: snapshot.data?.length ?? 0,
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void loadMoreData() => _postsBloc.getPosts();

  @override
  ScrollController get scrollController => _scrollCtrl;
}
