
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';
/// Log out User
class Logout{
  /// Constructor
  Logout(this.repository);

  /// Repository
  final UserRepository repository;

  Future<void> call(NoParams params) => repository.logout();
}
