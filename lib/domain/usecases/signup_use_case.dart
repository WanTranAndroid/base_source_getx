import 'package:base_source_getx/app/core/usecases/pram_usecase.dart';
import 'package:base_source_getx/domain/entities/user.dart';
import 'package:base_source_getx/domain/repositories/auth_repository.dart';

class SignUpUseCase extends ParamUseCase<User, String> {
  final AuthenticationRepository _repo;
  SignUpUseCase(this._repo);

  @override
  Future<User> execute(String username) {
    return _repo.signUp(username);
  }
}
