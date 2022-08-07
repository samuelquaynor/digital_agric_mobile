import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/tasks_entity.dart';
import '../bloc/tasks_bloc.dart';
import '../pages/tasks_page.dart';

class TasksWidget extends StatelessWidget {
  TasksWidget({super.key});

  final bloc = sl<TasksBloc>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: bloc.getTaksBloc(),
        builder: (context, AsyncSnapshot<List<TasksEntity?>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (context) => const TasksPage())),
                      child: RichText(
                          text: TextSpan(
                              text: 'No Tasks Available, ',
                              style: TextStyle(
                                  color: Colors.green.shade900, fontSize: 16),
                              children: const [
                            TextSpan(
                                text: 'Create Task.',
                                style: TextStyle(
                                    decoration: TextDecoration.underline))
                          ]))));
            } else {
              return SizedBox(
                  height: snapshot.data!.length <= 1 ? 130 : 400,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length <= 3
                          ? snapshot.data!.length
                          : 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 5))
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: ListTile(
                                  title: Text(
                                    '2d',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: const Text('due',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ))),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 13),
                                              child: Text(
                                                  '${snapshot.data?[index]?.name} due in 9 days\nvery soon and abroad',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 2))),
                                      const Chip(
                                          label: Text('Farm',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500)))
                                    ]))
                          ]))));
            }
          } else {
            return SizedBox(
                height: 160,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20))))));
          }
        });
  }
}
