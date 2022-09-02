import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/tasks_entity.dart';
import '../bloc/tasks_bloc.dart';

/// SlidableTaskWidget
class SlidableTaskWidget extends StatefulWidget {
  /// Constructor
  const SlidableTaskWidget({super.key, required this.tasks});

  /// List of tasks entities
  final List<TasksEntity> tasks;

  @override
  State<SlidableTaskWidget> createState() => _SlidableTaskWidgetState();
}

class _SlidableTaskWidgetState extends State<SlidableTaskWidget> {
  /// Tasks bloc
  final bloc = sl<TasksBloc>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: const Offset(0, 5))
                  ]),
              child: Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () async {
                        await showDialog<void>(
                            context: context,
                            builder: (context) => LoadingPage(
                                errorText:
                                    bloc.deleteTaskBloc(widget.tasks[index])));
                      }),
                      children: [
                        SlidableAction(
                            onPressed: (context) async {
                              await showDialog<void>(
                                  context: context,
                                  builder: (context) => LoadingPage(
                                      errorText: bloc.deleteTaskBloc(
                                          widget.tasks[index])));
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete'),
                        SlidableAction(
                            onPressed: (context) async {
                              final farm =
                                  widget.tasks[index].copyWith(status: 'Done');
                              await showDialog<void>(
                                  context: context,
                                  builder: (context) => LoadingPage(
                                      errorText: bloc.markDoneBloc(farm)));
                            },
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.check,
                            label: 'Mark As Done')
                      ]),
                  child: ListTile(
                      title: Text(
                          toBeginningOfSentenceCase(widget.tasks[index].name) ??
                              '',
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text(
                          toBeginningOfSentenceCase(
                                  widget.tasks[index].description) ??
                              '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white)))));
        });
  }
}
