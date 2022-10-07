import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'core/platform/gallery_info.dart';
import 'core/platform/launch_info.dart';
import 'core/platform/network_info.dart';
import 'core/usecases/download_image_url.dart';
import 'core/usecases/open_image_gallery.dart';
import 'core/usecases/open_multiple_images_gallery.dart';
import 'core/usecases/open_url.dart';
import 'core/usecases/upload_image.dart';
import 'core/user/user_injection.dart';
import 'core/weather/weather_injection.dart';
import 'features/login/login_injection.dart';
import 'features/predictions/prediction_injection.dart';
import 'features/settings/settings_injection.dart';
import 'features/signup/sign_up_injection.dart';

/// Getter
final sl = GetIt.instance;

/// Initialize
void init() {
  //! Core
  initCore();
  //! Features
  initFeatures();
//! External
  initExternal();
}

/// Core files
void initCore() {
  ///Weather Dependencies
  initWeather();

  initUser();

  // Network Package
  sl

    // Pick image from gallery
    ..registerLazySingleton(() => OpenImageGallery(sl()))
    // Pick multiple images from gallery
    ..registerLazySingleton(() => OpenMultipleImageGallery(sl()))
    // Upload an image to firebase
    ..registerLazySingleton(() => UploadFirebaseImage(sl()))
    // Download an imageUrl from firebase
    ..registerLazySingleton(() => DownLoadImageUrl(sl()))

    // Image picker Package
    ..registerLazySingleton<GalleryInfo>(() => GalleryInfoImpl(sl()))
    // Launch Package
    ..registerLazySingleton<LaunchInfo>(LaunchInfoImpl.new)
    // Open Url
    ..registerLazySingleton(() => OpenUrl(sl()))
    // Network Package
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);
}

/// Initialize features
void initFeatures() {
  // Login dependencies
  initLogin();

  initSignUp();

  initSettings();

  initPrediction();
}

/// External packages
void initExternal() {
  sl
    ..registerLazySingleton(ImagePicker.new)
    ..registerLazySingleton<HiveInterface>(() => Hive);
}
