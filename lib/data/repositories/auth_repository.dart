import 'package:base_source_getx/domain/entities/user.dart';
import 'package:base_source_getx/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<User> signUp(String username) async {
    //Fake sign up action
    await Future.delayed(const Duration(seconds: 1));
    return User(username: username);
  }
}
