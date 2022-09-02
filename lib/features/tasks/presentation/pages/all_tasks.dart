import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../bloc/tasks_bloc.dart';
import 'calendar_page.dart';

/// All Tasks Page
class AllTasks extends StatefulWidget {
  /// Constructor
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
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
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.green.shade900,
                icon: const Icon(Icons.arrow_back)),
            title: Text('All Tasks',
                style: Theme.of(context).textTheme.titleMedium),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarPage()));
                  },
                  child: const Icon(Icons.calendar_today))
            ]),
        body: Builder(builder: (context) {
          if (user != UserEntity.initial()) {
            if (user.tasks.isNotEmpty) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('All Tasks',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        Expanded(
                            child: ListView.builder(
                                itemCount: user.tasks.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                      height: 70,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade300,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.2),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                offset: const Offset(0, 5))
                                          ]),
                                      child: Slidable(
                                          key: const ValueKey(0),
                                          endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                    onPressed: (context) async {
                                                      await showDialog<void>(
                                                          context: context,
                                                          builder: (context) => LoadingPage(
                                                              errorText: bloc
                                                                  .deleteTaskBloc(
                                                                      user.tasks[
                                                                          index])));
                                                    },
                                                    backgroundColor:
                                                        const Color(0xFFFE4A49),
                                                    foregroundColor:
                                                        Colors.white,
                                                    icon: Icons.delete,
                                                    label: 'Delete')
                                              ]),
                                          child: ListTile(
                                              title: Text(toBeginningOfSentenceCase(user.tasks[index].name) ?? '',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              subtitle: Text(
                                                  toBeginningOfSentenceCase(user
                                                          .tasks[index]
                                                          .description) ??
                                                      '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white)))));
                                }))
                      ]));
            } else {
              return const Center(child: Text('No Tasks Available'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
