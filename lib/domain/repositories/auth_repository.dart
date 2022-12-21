import 'package:base_source_getx/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> signUp(String username);
}
