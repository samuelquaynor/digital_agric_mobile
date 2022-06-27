import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';

class CloudStorageInfo {
  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;
}

List<CloudStorageInfo> demoMyFiles = [
  CloudStorageInfo(
    title: 'Temperature',
    svgSrc: 'assets/svg/Documents.svg',
    totalStorage: '31°C',
    color: primaryColor,
    percentage: 31,
  ),
  CloudStorageInfo(
    title: 'Humidity',
    svgSrc: 'assets/svg/google_drive.svg',
    totalStorage: '54%',
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: 'Moisture',
    svgSrc: 'assets/svg/one_drive.svg',
    totalStorage: '100',
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: 'Water',
    svgSrc: 'assets/svg/drop_box.svg',
    totalStorage: '73%',
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];
