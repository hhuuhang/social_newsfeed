import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/01_welcome_page/page/welcome_page.dart';
import 'package:social_newsfeed/modules/06_home_page/page/dash_board.dart';
import 'package:social_newsfeed/modules/06_home_page/page/home_page.dart';
import 'package:social_newsfeed/modules/authentication/pages/welcome_page.dart';
import 'package:social_newsfeed/modules/posts/blocs/list_posts_rxdart_bloc.dart';
import 'package:social_newsfeed/modules/posts/blocs/post_detail_bloc.dart';
import 'package:social_newsfeed/modules/posts/models/post.dart';
import 'package:social_newsfeed/modules/posts/pages/create_post_page.dart';
import 'package:social_newsfeed/modules/posts/pages/post_detail_page.dart';
import 'package:social_newsfeed/providers/bloc_provider.dart';
import 'package:social_newsfeed/route/route_name.dart';

class Routes {
  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          BlocProvider(
            bloc: ListPostsRxDartBloc()..getPosts(),
            child: const DashboardPage(),
          ),
        );
      case RouteName.createPostPage:
        return _buildRouteDialog(
          settings,
          const CreatePostPage(),
        );
      case RouteName.postDetailPage:
        final post = settings.arguments;
        if (post is Post) {
          return _buildRoute(
            settings,
            BlocProvider(
              bloc: PostDetailBloc(post.id!),
              child: PostDetailPage(post: post),
            ),
          );
        }
        return _errorRoute();

      case RouteName.DashboardPage:
        return _buildRouteDialog(
          settings,
          const DashboardPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          // const WelcomePage(),
          const WelcomePageApp(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }
}
