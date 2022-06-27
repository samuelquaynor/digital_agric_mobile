import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Farm Utilities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: 'assets/svg/Documents.svg',
            title: 'Manure',
            amountOfFiles: '50kg',
          ),
          StorageInfoCard(
            svgSrc: 'assets/svg/media.svg',
            title: 'Insecticides',
            amountOfFiles: '12000l',
          ),
          StorageInfoCard(
            svgSrc: 'assets/svg/folder.svg',
            title: 'Potassium',
            amountOfFiles: '150kg',
          ),
          StorageInfoCard(
            svgSrc: 'assets/svg/unknown.svg',
            title: 'Seeds',
            amountOfFiles: '200bag',
          ),
        ],
      ),
    );
  }
}
