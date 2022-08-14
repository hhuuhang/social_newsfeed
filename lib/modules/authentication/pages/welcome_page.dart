import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_newsfeed/blocs/app_state_bloc.dart';
import 'package:social_newsfeed/common/widgets/stateless/error_popup.dart';
import 'package:social_newsfeed/modules/authentication/bloc/authentication_bloc.dart';
import 'package:social_newsfeed/modules/authentication/enum/login_state.dart';
import 'package:social_newsfeed/providers/bloc_provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);
  AuthenticationBloc? get authenBloc =>
      BlocProvider.of<AuthenticationBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Login with Gooogle'),
          onPressed: _signInWithGmail,
        ),
      ),
    );
  }

  Future<void> _signInWithGmail() async {
    // loading!(true);
    try {
      final loginState = await authenBloc!.loginWithGmail();
      switch (loginState) {
        case LoginState.success:
          return _changeAppState();
        case LoginState.newUser:
          // handle flow newUser
          break;
        default:
          break;
      }
    } on PlatformException catch (e) {
      // loading!(false);
      _handleErrorPlatformException(e);
    } catch (e) {
      _showDialog('Something went wrong!!!');
    }
  }

  void _changeAppState() {
    appStateBloc!.changeAppState(AppState.authorized);
  }

  void _handleErrorPlatformException(PlatformException e) {
    if (e.code != 'ERROR_ABORTED_BY_USER') {
      _showDialog(e.message ?? '');
    }
  }

  void _showDialog(String content) {
    showDialog(
      context: context,
      builder: (ctx) => ErrorPopup(content: content),
    );
  }
}
