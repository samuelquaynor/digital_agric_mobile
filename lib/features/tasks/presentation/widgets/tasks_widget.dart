import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';
import '../../../farms/domain/entities/farm_entity.dart';
import '../../domain/entities/tasks_entity.dart';
import '../bloc/tasks_bloc.dart';
import '../pages/tasks_page.dart';

class TasksWidget extends StatelessWidget {
  TasksWidget({super.key, required this.farms});

  final bloc = sl<TasksBloc>();

  final List<FarmEntity?> farms;

  List<FarmEntity?> findFarm(
      {required List<FarmEntity?> farmEntites,
      required List<dynamic> farmStrings}) {
    final result = <FarmEntity?>[];
    for (final farmString in farmStrings) {
      result.addAll(farmEntites
          .where((farmEntity) => farmEntity?.id == farmString.toString()));
    }
    return result;
  }

  Builder? dateDifference(
      {required String startTime,
      required String endTime,
      required List<TasksEntity?> tasks,
      required int index}) {
    final diff = DateTime.now().difference(DateTime.parse(endTime));
    if (diff.inDays >= 1) {
      return Builder(builder: (context) {
        return Row(children: [
          Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: ListTile(
                title: Text(
                  '${diff.inDays}d',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('due',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              '${tasks[index]?.name} was not\nperformed. delayed ',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '${diff.inDays} days',
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500))
                    ])),
                    Wrap(
                        spacing: 10,
                        children: findFarm(
                                farmEntites: farms,
                                farmStrings: tasks[index]?.farms ?? <String>[])
                            .map((farm) {
                          return Chip(label: Text('${farm?.name}'));
                        }).toList()),
                  ]))
        ]);
      });
    } else if (diff.inHours >= 1) {
      return Builder(builder: (context) {
        return Row(children: [
          Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: ListTile(
                title: Text(
                  '${diff.inHours}h',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('due',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              '${tasks[index]?.name} was not\nperformed. delayed ',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '${diff.inHours} hours',
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500))
                    ])),
                    Wrap(
                        spacing: 10,
                        children: findFarm(
                                farmEntites: farms,
                                farmStrings: tasks[index]?.farms ?? <String>[])
                            .map((farm) {
                          return Chip(label: Text('${farm?.name}'));
                        }).toList()),
                  ]))
        ]);
      });
    } else if (diff.inMinutes >= 1) {
      return Builder(builder: (context) {
        return Row(children: [
          Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: ListTile(
                title: Text(
                  '${diff.inMinutes}m',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('due',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              '${tasks[index]?.name} was not\nperformed. delayed ',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '${diff.inMinutes} minutes',
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500))
                    ])),
                    Wrap(
                        spacing: 10,
                        children: findFarm(
                                farmEntites: farms,
                                farmStrings: tasks[index]?.farms ?? <String>[])
                            .map((farm) {
                          return Chip(label: Text('${farm?.name}'));
                        }).toList()),
                  ]))
        ]);
      });
    } else if (diff.inSeconds >= 1) {
      return Builder(builder: (context) {
        return Row(children: [
          Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: ListTile(
                title: Text(
                  '${diff.inSeconds}s',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('due',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              '${tasks[index]?.name} was not\nperformed. delayed ',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '${diff.inSeconds} seconds',
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500))
                    ])),
                    Wrap(
                        spacing: 10,
                        children: findFarm(
                                farmEntites: farms,
                                farmStrings: tasks[index]?.farms ?? <String>[])
                            .map((farm) {
                          return Chip(label: Text('${farm?.name}'));
                        }).toList()),
                  ]))
        ]);
      });
    } else {
      if (diff.inDays <= -1) {
        return Builder(builder: (context) {
          return Row(children: [
            Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ListTile(
                  title: Text(
                    '${diff.inDays.abs()}d',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('left',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ))),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${tasks[index]?.name} required in the\n',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: 'next ${diff.inDays.abs()} days',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500))
                      ])),
                      Wrap(
                          spacing: 10,
                          children: findFarm(
                                  farmEntites: farms,
                                  farmStrings:
                                      tasks[index]?.farms ?? <String>[])
                              .map((farm) {
                            return Chip(label: Text('${farm?.name}'));
                          }).toList()),
                    ]))
          ]);
        });
      } else if (diff.inHours <= -1) {
        return Builder(builder: (context) {
          return Row(children: [
            Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ListTile(
                  title: Text(
                    '${diff.inHours.abs()}h',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('left',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ))),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${tasks[index]?.name} required in the\n',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: 'next ${diff.inHours.abs()} hours',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500))
                      ])),
                      Wrap(
                          spacing: 10,
                          children: findFarm(
                                  farmEntites: farms,
                                  farmStrings:
                                      tasks[index]?.farms ?? <String>[])
                              .map((farm) {
                            return Chip(label: Text('${farm?.name}'));
                          }).toList()),
                    ]))
          ]);
        });
      } else if (diff.inMinutes <= -1) {
        return Builder(builder: (context) {
          return Row(children: [
            Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ListTile(
                  title: Text(
                    '${diff.inMinutes.abs()}m',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('left',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ))),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${tasks[index]?.name} required in the\n',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: 'next ${diff.inMinutes.abs()} minutes',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500))
                      ])),
                      Wrap(
                          spacing: 10,
                          children: findFarm(
                                  farmEntites: farms,
                                  farmStrings:
                                      tasks[index]?.farms ?? <String>[])
                              .map((farm) {
                            return Chip(label: Text('${farm?.name}'));
                          }).toList()),
                    ]))
          ]);
        });
      } else if (diff.inSeconds <= -1) {
        return Builder(builder: (context) {
          return Row(children: [
            Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ListTile(
                  title: Text(
                    '${diff.inSeconds.abs()}s',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('left',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ))),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${tasks[index]?.name} required in the\n',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: 'next ${diff.inSeconds.abs()} seconds',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500))
                      ])),
                      Wrap(
                          spacing: 10,
                          children: findFarm(
                                  farmEntites: farms,
                                  farmStrings:
                                      tasks[index]?.farms ?? <String>[])
                              .map((farm) {
                            return Chip(label: Text('${farm?.name}'));
                          }).toList()),
                    ]))
          ]);
        });
      }
      return null;
    }
  }

  // String stringReponseOnDate({}){}
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
                          child: dateDifference(
                              endTime: snapshot.data?[index]?.endTime ?? '',
                              startTime: snapshot.data?[index]?.startTime ?? '',
                              index: index,
                              tasks: snapshot.data ?? []))));
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
