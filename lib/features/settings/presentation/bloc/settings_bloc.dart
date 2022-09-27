import 'package:equatable/equatable.dart';

import '../../../../core/usecases/download_image_url.dart';
import '../../../../core/usecases/open_image_gallery.dart';
import '../../../../core/usecases/open_url.dart';
import '../../../../core/usecases/upload_image.dart';
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
      required this.openUrl,
      required this.openImageGallery,
      required this.uploadFirebaseImage,
      required this.downLoadImageUrl,
      required this.retrieveUser});

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Logs out a user
  final Logout logout;

  /// Change user details
  final UpdateUser updateUser;

  /// Opens phone or a browser
  final OpenUrl openUrl;

  /// Open gallery for image
  final OpenImageGallery openImageGallery;

  /// Upload image to storage
  final UploadFirebaseImage uploadFirebaseImage;

  /// Download image url
  final DownLoadImageUrl downLoadImageUrl;

  /// Get User
  Future<UserEntity> retrieveUserBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => UserEntity.initial(), (r) async {
      return r.copyWith(
          avatar: r.avatar != null ? await downloadImage(r.avatar ?? '') : '');
    });
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

  /// Open browser
  void openBrowser(String url) => openUrl(StringParams(url));

  /// Get image
  Future<String> _retrieveImage() async {
    final result = await openImageGallery(NoParams());
    return result.fold((f) => '', (path) => path);
  }

  Future<String> _uploadImage() async {
    final image = await _retrieveImage();
    final result = await uploadFirebaseImage(StringParams(image));
    return result.fold((f) => '', (path) => path);
  }

  /// get image link from Firebase
  Future<String?> downloadImage(String uploadLink) async {
    final result = await downLoadImageUrl(StringParams(uploadLink));
    return result.fold((failure) => null, (url) => url);
  }

  /// Change avatar
  Future<String?> changeAvatar() async {
    final avatarUrl = await _uploadImage();
    final localUser = await retrieveUserBloc();
    final result = await updateUser(
        UpdateUserParams(localUser.copyWith(avatar: avatarUrl)));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((failure) => failure.toString(), (user) => null);
  }
}
