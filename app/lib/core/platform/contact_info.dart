// import 'package:dartz/dartz.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart'
//     show FlutterContactPicker, UserCancelledPickingException;
//
// import '../domain/entities/contact.dart';
// import '../error/failures.dart';
//
// /// Interacts with native contact api
// abstract class ContactInfo {
//   ///  Opens native contact app
//   Future<Either<Failure, Contact>> contact();
// }
// /// Implements [ContactInfo}
// class ContactInfoImpl implements ContactInfo {
//   @override
//   Future<Either<Failure, Contact>> contact() async {
//     try {
//       if (!(await FlutterContactPicker.hasPermission())) {
//         await FlutterContactPicker.requestPermission();
//       }
//       final contact = await FlutterContactPicker.pickPhoneContact();
//       return Right(Contact(
//           name: contact.fullName ?? 'No name',
//           phoneNumber: contact.phoneNumber!.number ?? ''));
//     } on PlatformException {
//       return const Left(Failure(
//           "Device Error!🔔.\nYour device doesn't support this action."));
//     } on UserCancelledPickingException {
//       return const Left(
//           Failure("Device Error!.\nUser didn't select any contact."));
//     }
//   }
// }
