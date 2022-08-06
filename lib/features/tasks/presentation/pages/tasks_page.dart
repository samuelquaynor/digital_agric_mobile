import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widgets/active_project_card.dart';
import '../widgets/back_button.dart';
import '../widgets/task_column.dart';
import '../widgets/top_container.dart';
import 'calendar_page.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      TopContainer(
          height: 150,
          width: width,
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyBackButton(),
                      Icon(Icons.search, color: Colors.green.shade900, size: 25)
                    ])),
            Row(children: <Widget>[
              CircularPercentIndicator(
                  radius: 40,
                  animation: true,
                  percent: 0.75,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.red,
                  backgroundColor: Colors.yellow.shade700,
                  center: CircleAvatar(
                      backgroundColor: Colors.green.shade800,
                      radius: 35,
                      backgroundImage:
                          const AssetImage('assets/images/profile_pic.png'))),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: <Widget>[
                  Text(
                    'Kelvin Anakpor',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text('Farmer',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.w400))
                ]),
              )
            ])
          ])),
      Expanded(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'My Tasks',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarPage()),
                          );
                        },
                        child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.calendar_today,
                                size: 20, color: Colors.white)))
                  ]),
              const SizedBox(height: 15),
              const TaskColumn(
                  icon: Icons.alarm,
                  iconBackgroundColor: Colors.red,
                  title: 'To Do',
                  subtitle: '5 tasks now. 1 started'),
              const SizedBox(height: 15),
              TaskColumn(
                  icon: Icons.blur_circular,
                  iconBackgroundColor: Colors.yellow.shade700,
                  title: 'In Progress',
                  subtitle: '1 tasks now. 1 started'),
              const SizedBox(height: 15),
              const TaskColumn(
                  icon: Icons.check_circle_outline,
                  iconBackgroundColor: Colors.blue,
                  title: 'Done',
                  subtitle: '18 tasks now. 13 started')
            ])),
        Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Active Projects',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 5),
                  Row(children: const <Widget>[
                    ActiveProjectsCard(
                        cardColor: Colors.green,
                        loadingPercent: 0.25,
                        title: 'Medical App',
                        subtitle: '9 hours progress'),
                    SizedBox(width: 20),
                    ActiveProjectsCard(
                        cardColor: Colors.red,
                        loadingPercent: 0.6,
                        title: 'Making History Notes',
                        subtitle: '20 hours progress')
                  ]),
                  Row(children: <Widget>[
                    ActiveProjectsCard(
                        cardColor: Colors.yellow.shade700,
                        loadingPercent: 0.45,
                        title: 'Sports App',
                        subtitle: '5 hours progress'),
                    const SizedBox(width: 20),
                    const ActiveProjectsCard(
                        cardColor: Colors.blue,
                        loadingPercent: 0.9,
                        title: 'Online Flutter Course',
                        subtitle: '23 hours progress')
                  ])
                ]))
      ])))
    ])));
  }
}
