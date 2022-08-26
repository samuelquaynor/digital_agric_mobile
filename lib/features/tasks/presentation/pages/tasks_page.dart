import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/util/converters.dart';
import '../../../../injection_container.dart';
import '../bloc/tasks_bloc.dart';
import '../widgets/active_project_card.dart';
import '../widgets/back_button.dart';
import '../widgets/task_column.dart';
import '../widgets/top_container.dart';
import 'calendar_page.dart';
import 'create_task.dart';

/// Tasks Page
class TasksPage extends StatelessWidget {
  /// Constructor
  TasksPage({super.key});

  /// Tasks bloc
  final bloc = sl<TasksBloc>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
            future: bloc.retrieveUserBloc(),
            builder: (context, AsyncSnapshot<UserEntity?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SafeArea(
                    child: Column(children: <Widget>[
                  TopContainer(
                      height: 150,
                      width: width,
                      child: Column(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyBackButton(),
                                  Icon(Icons.search,
                                      color: Colors.green.shade900, size: 25)
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
                                  backgroundImage: const AssetImage(
                                      'assets/images/profile_pic.png'))),
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(children: <Widget>[
                                Text(
                                  snapshot.data?.name.capitalize() ?? '',
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
                              ]))
                        ])
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                    Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('My Tasks',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push<void>(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalendarPage()));
                                    },
                                    child: const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.green,
                                        child: Icon(Icons.calendar_today,
                                            size: 20, color: Colors.white)))
                              ]),
                          const SizedBox(height: 15),
                          if (snapshot.data != null &&
                              snapshot.data!.tasks.isEmpty)
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('No tasks Available. '),
                                  GestureDetector(
                                      onTap: () => Navigator.of(context)
                                          .push<void>(MaterialPageRoute(
                                              builder: (context) =>
                                                  const CreateNewTaskPage())),
                                      child: const Text('Create One',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline)))
                                ])
                          else
                            Column(children: [
                              // TaskColumn(
                              //     icon: Icons.alarm,
                              //     iconBackgroundColor: Colors.red,
                              //     title: 'Overdue',
                              //     subtitle:
                              //         '${snapshot.data?.tasks.where((task) => task.status == 'To-do').length ?? 0} tasks now.'),
                              const SizedBox(height: 15),
                              TaskColumn(
                                  icon: Icons.alarm,
                                  iconBackgroundColor: Colors.green,
                                  title: 'To Do',
                                  subtitle:
                                      '${snapshot.data?.tasks.where((task) => task.status == 'To-do').length ?? 0} tasks now.'),
                              const SizedBox(height: 15),
                              TaskColumn(
                                  icon: Icons.blur_circular,
                                  iconBackgroundColor: Colors.yellow.shade700,
                                  title: 'In Progress',
                                  subtitle:
                                      '${snapshot.data?.tasks.where((task) => task.status == 'In-progess').length ?? 0} tasks now.'),
                              const SizedBox(height: 15),
                              TaskColumn(
                                  icon: Icons.check_circle_outline,
                                  iconBackgroundColor: Colors.blue,
                                  title: 'Done',
                                  subtitle:
                                      '${snapshot.data?.tasks.where((task) => task.status == 'Done').length ?? 0} tasks now.')
                            ])
                        ])),
                    if (snapshot.data != null &&
                        snapshot.data!.tasks.isNotEmpty)
                      Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Active Projects',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                const SizedBox(height: 5),
                                GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: snapshot.data!.tasks
                                        .where((task) => task.status != 'Done')
                                        .toList()
                                        .map((task) => ActiveProjectsCard(
                                              cardColor: Colors.primaries[
                                                  Random().nextInt(
                                                      Colors.primaries.length)],
                                              loadingPercent: 0.25,
                                              title: task.name,
                                              subtitle: '9',
                                              diff: DateTime.now().difference(
                                                  DateTime.parse(task.endTime)),
                                            ))
                                        .toList())
                              ]))
                    else
                      const SizedBox.shrink()
                  ])))
                ]));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
