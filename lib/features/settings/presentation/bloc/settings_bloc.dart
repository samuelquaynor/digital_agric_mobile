import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/usecases/get_user.dart';
import '../../../../core/user/domain/usecases/logout.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc {
  SettingsBloc({required this.logout, required this.retrieveUser}) : super();

  /// Get user info
  final GetUser retrieveUser;

  /// Logs out a user
  final Logout logout;

  /// Get user details
  Future<User> user() async => retrieveUser(NoParams());

  /// Log out a user
  Future<String?> logoutUser() {
    logout(NoParams());
    return Future.delayed(const Duration(seconds: 1), () => null);
  }
}
