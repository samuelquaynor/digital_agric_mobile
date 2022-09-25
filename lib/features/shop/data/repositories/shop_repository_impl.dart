import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/shop_repository.dart';
import '../datasources/shop_local_database.dart';

/// ShopRepository
class ShopRepositoryImpl implements ShopRepository {
  /// Constructor
  ShopRepositoryImpl({required this.networkInfo, required this.localDatabase});

  /// Shop Local Database
  final ShopLocalDatabase localDatabase;

  /// Network adapter
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>> createOrder(OrderEntity orderEntity) async {
    final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    try {
      await networkInfo.hasInternet();
      final users =
          FirebaseFirestore.instance.collection('users/$userid/orders');
      await users
          .add(<String, dynamic>{
            'createdAt': orderEntity.createdAt,
            'userId': userid,
            'totalPrice': orderEntity.totalPrice,
            'deliveryPrice': orderEntity.deliveryPrice,
            'destinationLongitude': orderEntity.destinationLongitude,
            'destinationLatitude': orderEntity.destinationLatitude,
            'destinationName': orderEntity.destinationName,
            'carts': orderEntity.carts
                .map((cart) => {
                      'initialPrice': cart?.initialPrice,
                      'quantity': cart?.quantity,
                      'totalPrice': cart?.totalPrice,
                      'product': {'id': cart?.product?.id}
                    })
                .toList()
          })
          .then((value) => '')
          .catchError((dynamic error) => 'Failed to create task $error');
      return right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      await networkInfo.hasInternet();
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('categories').get();
      final result = json.encode(snapshot.value);
      final jsonParse = json.decode(result) as List<dynamic>;
      final jsonE = jsonParse
          .cast<Map<String, dynamic>>()
          .map<Category>(Category.fromJson)
          .toList();
      return Right(jsonE);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Cart?>>> retrieveCarts(bool local) async {
    try {
      await networkInfo.hasInternet();
      final cart = await localDatabase.retrieveCarts();
      return Right(cart);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, String?>> saveCarts(List<Cart?> carts) async {
    try {
      await networkInfo.hasInternet();
      await localDatabase.save(carts);
      return const Right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
