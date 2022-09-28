import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Active Tasks
class ActiveProjectsCard extends StatelessWidget {
  /// Constructor
  const ActiveProjectsCard({
    super.key,
    required this.cardColor,
    required this.loadingPercent,
    required this.title,
    required this.subtitle,
    required this.diff,
  });

  /// Card Color
  final Color cardColor;

  /// Loading Percent
  final double loadingPercent;

  /// Card Title
  final String title;

  /// Card Subtitle
  final String subtitle;

  /// Date diff
  final Duration diff;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(15),
            height: 190,
            decoration: BoxDecoration(
                color: cardColor, borderRadius: BorderRadius.circular(40)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircularPercentIndicator(
                      animation: true,
                      radius: 40,
                      percent: loadingPercent,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.white10,
                      progressColor: Colors.white,
                      center: Text('${(loadingPercent * 100).round()}%',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                        // Text('${subtitle} days proge',
                        //     style: const TextStyle(
                        //         fontSize: 12,
                        //         color: Colors.white54,
                        //         fontWeight: FontWeight.w400))
                      ])
                ])));
  }
}
