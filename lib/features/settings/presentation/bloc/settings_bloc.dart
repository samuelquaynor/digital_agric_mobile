import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/update.dart';
import '../../../../core/user/domain/usecases/logout.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// Settings Bloc
class SettingsBloc {
  /// Constructor
  SettingsBloc(
      {required this.logout,
      required this.updateUser,
      required this.retrieveUser});

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Logs out a user
  final Logout logout;

  /// Change user details
  final UpdateUser updateUser;

  /// Get User
  Future<UserEntity> retrieveUserBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => UserEntity.initial(), (r) => r);
  }

  /// Log out a user
  Future<String?> logoutUser() {
    logout(NoParams());
    return Future.delayed(const Duration(seconds: 1), () => null);
  }

  /// Change email address or name
  Future<String?> changeNameEmail(
      {required String name, required String email}) async {
    final localUser = await retrieveUserBloc();
    final result = await updateUser(
        UpdateUserParams(localUser.copyWith(name: name, email: email)));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((failure) => failure.toString(), (user) => null);
  }

  /// Change phone Number
  Future<String?> changePhoneNumber(String phoneNumber) async {
    final localUser = await retrieveUserBloc();
    final result = await updateUser(
        UpdateUserParams(localUser.copyWith(phoneNumber: phoneNumber)));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((failure) => failure.toString(), (user) => null);
  }

  /// Change user password
  Future<String?> changePassword(String password) async {
    // final result = await signInApple(NoParams());
    // return result.fold((failure) => failure.toString(), (user) => null);
    return 'Change password is unavailable!';
  }
}
