import 'package:equatable/equatable.dart';

import '../../../../core/usecases/download_image_url.dart';
import '../../../../core/usecases/open_image_gallery.dart';
import '../../../../core/usecases/upload_image.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';
import '../../../tasks/domain/entities/tasks_entity.dart';
import '../../../tasks/domain/usecases/delete_task.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../../domain/usecases/create_farm.dart';
import '../../domain/usecases/delete_farm.dart';
import '../../domain/usecases/edit_farm.dart';
import '../../domain/usecases/get_crop_info.dart';
import '../../domain/usecases/get_farms.dart';

part 'farms_event.dart';
part 'farms_state.dart';

/// Farm Bloc
class FarmsBloc {
  /// Constructor
  FarmsBloc(
      {required this.retrieveUser,
      required this.createFarm,
      required this.getCropInfo,
      required this.deleteFarm,
      required this.editFarm,
      required this.deleteTaskUsc,
      required this.openImageGallery,
      required this.uploadFirebaseImage,
      required this.downLoadImageUrl,
      required this.getFarm});

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Create Farm Usecase
  final CreateFarm createFarm;

  /// Get Farm Usecase
  final GetFarm getFarm;

  /// Delete Farm Usecase
  final DeleteFarm deleteFarm;

  /// Edit Farm Usecase
  final EditFarm editFarm;

  /// Get Crop Info Usecase
  final GetCropInfo getCropInfo;

  /// Delete Tasks Usecase
  final DeleteTask deleteTaskUsc;

  /// Open gallery for image
  final OpenImageGallery openImageGallery;

  /// Upload image to storage
  final UploadFirebaseImage uploadFirebaseImage;

  /// Download image url
  final DownLoadImageUrl downLoadImageUrl;

  /// Create a Farm
  Future<String?> createFarmBloc(FarmEntity farm) async {
    final result = await createFarm(CreateFarmParams(farm));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Query Farms
  Future<List<FarmEntity?>> getFarmsBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => [], (r) => r.farms);
  }

  /// Query Farms
  Future<String?> getFarmAvatarUrl(String url) async {
    final result = url != '' ? await downloadImage(url) : '';
    return result;
  }

  /// Query Tasks
  Future<List<TasksEntity?>> getTasksBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => [], (r) => r.tasks);
  }

  /// Delete Tasks bloc
  Future<String?> deleteTaskBloc(TasksEntity task) async {
    final result = await deleteTaskUsc(DeleteTaskParams(task));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Get Categories from usecase
  Future<List<CropInfo?>> getCropInfoBloc() async {
    final result = await getCropInfo(NoParams());
    return result.fold((l) => [], (r) => r);
  }

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
    return result.fold((failure) => '', (url) => url);
  }

  /// Mark Tasks as Done bloc
  Future<String?> updateFarmBloc(FarmEntity farm) async {
    final result = await editFarm(EditFarmParams(farm));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Delete Tasks bloc
  Future<String?> deleteFarmBloc(FarmEntity farm) async {
    final result = await deleteFarm(DeleteFarmParams(farm));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Change avatar
  Future<String?> changeAvatar() async => _uploadImage();
}
