import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/util/converters.dart';
import '../../../../injection_container.dart';
import '../bloc/tasks_bloc.dart';
import '../widgets/back_button.dart';
import '../widgets/slidable_tasks_widget.dart';
import '../widgets/task_column.dart';
import '../widgets/top_container.dart';
import 'all_tasks.dart';
import 'create_task.dart';

/// Tasks Page
class TasksPage extends StatefulWidget {
  /// Constructor
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  /// Tasks bloc
  final bloc = sl<TasksBloc>();

  UserEntity user = UserEntity.initial();

  Future<void> loadUser() async {
    final userSta = await bloc.retrieveUserBloc();
    setState(() {
      user = userSta;
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    loadUser();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: IconButton(
                onPressed: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateNewTaskPage()));
                },
                icon: const Icon(Icons.add))),
        body: Builder(builder: (context) {
          if (user != UserEntity.initial()) {
            return SafeArea(
                child: Column(children: <Widget>[
              TopContainer(
                  height: 150,
                  width: width,
                  child: Column(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: MyBackButton()),
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
                              user.name.capitalize(),
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
                                style: Theme.of(context).textTheme.titleMedium),
                            Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () => Navigator.of(context)
                                        .push<void>(MaterialPageRoute(
                                            builder: (context) =>
                                                const AllTasks())),
                                    icon: const Icon(Icons.arrow_forward),
                                    label: Text('View Tasks',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)),
                              ],
                            )
                          ]),
                      const SizedBox(height: 15),
                      if (user.tasks.isEmpty)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('No tasks Available. '),
                              GestureDetector(
                                  onTap: () => Navigator.of(context).push<void>(
                                      MaterialPageRoute(
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
                          //         '${snapshot.requireData?.tasks.where((task) => task.status == 'To-do').length ?? 0} tasks now.'),
                          const SizedBox(height: 15),
                          TaskColumn(
                              icon: Icons.alarm,
                              iconBackgroundColor: Colors.green,
                              title: 'To Do',
                              subtitle:
                                  '${user.tasks.where((task) => task.status == 'To-do').length} tasks now.'),
                          const SizedBox(height: 15),
                          TaskColumn(
                              icon: Icons.blur_circular,
                              iconBackgroundColor: Colors.yellow.shade700,
                              title: 'In Progress',
                              subtitle:
                                  '${user.tasks.where((task) => task.status == 'In-progess').length} tasks now.'),
                          const SizedBox(height: 15),
                          TaskColumn(
                              icon: Icons.check_circle_outline,
                              iconBackgroundColor: Colors.blue,
                              title: 'Done',
                              subtitle:
                                  '${user.tasks.where((task) => task.status == 'Done').length} tasks now.'),
                          if (user.tasks
                              .where((task) => task.status != 'Done')
                              .isNotEmpty)
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Active Projects',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      const SizedBox(height: 5),
                                      SlidableTaskWidget(
                                          tasks: user.tasks
                                              .where((task) =>
                                                  task.status != 'Done')
                                              .toList(),
                                          loadUser: loadUser())
                                    ]))
                          else
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('No Current Tasks Available'),
                            )
                        ])
                    ]))
              ])))
            ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
