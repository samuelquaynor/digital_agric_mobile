// ignore_for_file: cascade_invocations

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

/// Retrieves image file from assets
Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return File('${(await getTemporaryDirectory()).path}/$path')
      .readAsBytesSync();
}

/// Get image file from getImageFileFromAssets
Future<Uint8List> getImageFile(String filename) async {
  Uint8List? val;
  await getImageFileFromAssets(filename).then((value) {
    val = value;
  });
  return val!;
}

/// Create a pdf report of plant disease
Future<bool> makeReport(
    {required String plant,
    required String disease,
    required String remedy}) async {
  final user = FirebaseAuth.instance.currentUser;
  final dateTime = DateTime.now().toString();

  /// get external storage directory
  await getExternalStorageDirectory();

  /// downloads path
  // const downloads = '/storage/emulated/0/Download';

  // const permission1 = Permission.storage;

  // String? dir;

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => pw.Container(
        child: pw
            .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Spacer(flex: 3),
          pw.Text(dateTime),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
            pw.Spacer(),
            pw.Text('DigiFarm',
                style: pw.TextStyle(
                    color: PdfColors.green,
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold)),
            pw.Spacer()
          ]),
          pw.Spacer(),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
            pw.Spacer(),
            pw.Text('Crop Analysis Report',
                style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    fontStyle: pw.FontStyle.italic)),
            pw.Spacer(),
          ]),
          pw.Spacer(),
          pw.Text('Email: ${user?.email}',
              style: const pw.TextStyle(color: PdfColors.black, fontSize: 18)),
          pw.SizedBox(height: 5),
          pw.Text('Plant: $plant',
              style: const pw.TextStyle(color: PdfColors.black, fontSize: 18)),
          pw.SizedBox(height: 5),
          pw.Text('Identified Disease: $disease',
              style: const pw.TextStyle(color: PdfColors.black, fontSize: 18)),
          pw.Spacer(flex: 2),
          pw.Text('Remedy: $remedy',
              style: const pw.TextStyle(color: PdfColors.black, fontSize: 16)),
        ]),
      ),
    ),
  );

  final name = '${plant}_${dateTime}_'
      .replaceAll(' ', '_')
      .replaceAll('.', '_')
      .replaceAll(':', '_');

  final directry = await getTemporaryDirectory();
  final pathdir = directry.path;

  final file = File('$pathdir/Report_$name.pdf');
  await file.writeAsBytes(await pdf.save());
  await Share.shareFiles([file.path]);

  return true;
}
