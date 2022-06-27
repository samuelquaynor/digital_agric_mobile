// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';

// import '../../../data/hive_adapters.dart';

// part 'user.freezed.dart';
// part 'user.g.dart';

// /// User entity
// /// flutter packages run build_runner build --delete-conflicting-outputs
// @HiveType(typeId: HiveAdapters.user)
// @freezed
// class User with _$User {
//   /// Constructor
//   @JsonSerializable(explicitToJson: true)
//   const factory User({
//     /// primary key
//     @HiveField(0) required String id,

//     /// Email Address
//     @HiveField(5) required String email,
//   }) = _User;

//   /// Initial state with default values
//   factory User.initial() => const User(
//         id: '',
//         email: '',
//       );

//   /// Convert from json to model
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
