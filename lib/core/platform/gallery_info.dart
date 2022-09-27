import 'dart:io' as io;

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../error/failures.dart';

/// Retrieve gallery of device
abstract class GalleryInfo {
  /// Gets a single image from gallery
  Future<Either<Failure, String>> retrieveImage();

  /// Gets multiple image from gallery
  Future<Either<Failure, List<String>>> retrieveMultipleImages();

  /// Uploads an image to firebase storage and returns the image
  Future<Either<Failure, String>> uploadImage(String filePath);
}

/// Implements [GalleryInfo]
class GalleryInfoImpl implements GalleryInfo {
  /// Constructor
  GalleryInfoImpl(this.picker);

  /// Image picker library to open gallery
  final ImagePicker picker;

  @override
  Future<Either<Failure, String>> retrieveImage() async {
    try {
      final file = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 25,
          maxHeight: 512,
          maxWidth: 512);
      if (file == null) {
        throw PlatformException(code: 'Invalid image path');
      }
      return Right(file.path);
    } on PlatformException {
      return const Left(Failure('Device failure.\nFailed to retrieve image.'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(String filePath) async {
    try {
      // Create a Reference to the file
      final ref = FirebaseStorage.instanceFor(bucket: 'gs://digi-farm103')
          .ref()
          .child('users')
          .child(filePath.split('/').last);
      final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': filePath});
      final result = await ref.putFile(io.File(filePath), metadata);
      return Right(result.ref.fullPath);
    } on PlatformException {
      return const Left(Failure('Device failure.\nFailed to retrieve image.'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> retrieveMultipleImages() async {
    try {
      final files = await picker.pickMultiImage(
          imageQuality: 25, maxHeight: 512, maxWidth: 512);
      if (files == null) {
        throw PlatformException(code: 'Invalid image path');
      }
      return Right(files.map<String>((file) => file.path).toList());
    } on PlatformException {
      return const Left(Failure('Device failure.\nFailed to retrieve image.'));
    }
  }
}
