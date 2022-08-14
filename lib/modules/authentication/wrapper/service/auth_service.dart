import 'package:social_newsfeed/modules/authentication/wrapper/models/login_data.dart';

abstract class AuthService {
//  Future<LoginData>loginWithApple();
  Future<LoginData?> loginWithGmail();
  // Future<LoginData?> loginWithEmailAndPass(RegisterUser user);
//  Future<LoginData>loginWithPhone(String phone,String pwd);
}
