import 'package:flutter/material.dart';

import '../../domain/entities/farm_entity.dart';

/// Single  Farm Page
class SingleFarmPage extends StatefulWidget {
  /// Constructor
  const SingleFarmPage({super.key, required this.farm});

  /// Farm Entity
  final FarmEntity farm;

  @override
  State<SingleFarmPage> createState() => _SingleFarmPageState();
}

class _SingleFarmPageState extends State<SingleFarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
          title: Text(widget.farm.name,
              style: Theme.of(context).textTheme.titleMedium)),
    );
  }
}
