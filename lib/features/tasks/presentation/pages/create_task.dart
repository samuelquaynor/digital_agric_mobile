import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../../../farms/domain/entities/farm_entity.dart';
import '../../../farms/presentation/bloc/farms_bloc.dart';
import '../../../farms/presentation/pages/create_farm.dart';
import '../../domain/entities/tasks_entity.dart';
import '../bloc/tasks_bloc.dart';
import '../widgets/back_button.dart';
import '../widgets/top_container.dart';

class CreateNewTaskPage extends StatefulWidget {
  const CreateNewTaskPage({super.key});

  @override
  State<CreateNewTaskPage> createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  List<String> selectedFarms = [];
  String selectedStatus = 'To-do';
  List<String> status = ['To-do', 'In-progess', 'Done'];
  final formKey = GlobalKey<FormState>();
  final bloc = sl<FarmsBloc>();
  final taskBloc = sl<TasksBloc>();
  late String title;
  late String description;
  final startDateTime = ValueNotifier<String>('2000-09-20 14:30');
  final endDateTime = ValueNotifier<String>('2000-09-20 14:30');
  final format = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const downwardIcon = Icon(Icons.keyboard_arrow_down, color: Colors.black54);
    return Scaffold(
        body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SafeArea(
                child: Column(children: <Widget>[
              TopContainer(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  height: 250,
                  child: Column(children: <Widget>[
                    MyBackButton(),
                    const SizedBox(height: 20),
                    Row(children: const <Widget>[
                      Text('Create new task',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700))
                    ]),
                    const SizedBox(height: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              validator: Validator.input,
                              onChanged: (value) => setState(() {
                                    title = value;
                                  }),
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  label: const Text('Title'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16))))
                          // Padding(
                          //     padding: const EdgeInsets.only(top: 16),
                          //     child: ValueListenableBuilder<String>(
                          //         valueListenable: startDate,
                          //         builder: (context, value, child) {
                          //           return GestureDetector(
                          //               onTap: () async {
                          //                 // final picked = await showDatePicker(
                          //                 //     context: context,
                          //                 //     initialDate: startDate.value,
                          //                 //     firstDate: DateTime(2015, 8),
                          //                 //     lastDate: DateTime(2101));
                          //                 // if (picked != null &&
                          //                 //     picked != startDate.value) {
                          //                 //   startDate.value = picked;
                          //                 // }
                          //               },
                          //               child: Row(
                          //                   crossAxisAlignment: CrossAxisAlignment.end,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   children: <Widget>[
                          //                     Column(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text('Date',
                          //                               style: Theme.of(context)
                          //                                   .textTheme
                          //                                   .bodyLarge),
                          //                           Text(
                          //                               DateFormatter.toDate(
                          //                                   startDate.value.toString()),
                          //                               style: Theme.of(context)
                          //                                   .textTheme
                          //                                   .subtitle1)
                          //                         ]),
                          //                     const CircleAvatar(
                          //                         radius: 25,
                          //                         backgroundColor: Colors.green,
                          //                         child: Icon(Icons.calendar_today,
                          //                             size: 20, color: Colors.white))
                          //                   ]));
                          //         }))
                        ])
                  ])),
              Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(children: <Widget>[
                        ValueListenableBuilder<String>(
                            valueListenable: startDateTime,
                            builder: (context, value, child) {
                              return DateTimeField(
                                  format: format,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a start date and time.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      label: const Text('Start Date and Time'),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      final time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              currentValue ?? DateTime.now()));
                                      startDateTime.value =
                                          DateTimeField.combine(date, time)
                                              .toString();
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  });
                            }),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ValueListenableBuilder<String>(
                                valueListenable: endDateTime,
                                builder: (context, value, child) {
                                  return DateTimeField(
                                      format: format,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select a start date and time.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          label:
                                              const Text('End Date and Time'),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16))),
                                      onShowPicker:
                                          (context, currentValue) async {
                                        final date = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                        if (date != null) {
                                          final time = await showTimePicker(
                                              context: context,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      currentValue ??
                                                          DateTime.now()));
                                          endDateTime.value =
                                              DateTimeField.combine(date, time)
                                                  .toString();
                                          return DateTimeField.combine(
                                              date, time);
                                        } else {
                                          return currentValue;
                                        }
                                      });
                                })),
                        const SizedBox(width: 40),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, right: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('Status',
                                  //     style: Theme.of(context).textTheme.titleMedium),
                                  DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      isExpanded: true,
                                      hint: const Text('Select Status',
                                          style: TextStyle(fontSize: 14)),
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.black45),
                                      iconSize: 30,
                                      buttonHeight: 50,
                                      buttonPadding: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedStatus = value.toString();
                                        });
                                      },
                                      items: status
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ))))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select a status.';
                                        }
                                        return null;
                                      })
                                ])),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                              minLines: 3,
                              maxLines: 5,
                              validator: Validator.input,
                              onChanged: (value) => setState(() {
                                    description = value;
                                  }),
                              decoration: InputDecoration(
                                  label: const Text('Description'),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder(
                            future: bloc.getFarmsBloc(),
                            builder: (context,
                                AsyncSnapshot<List<FarmEntity?>> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('No Farms Available. '),
                                        GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .push<void>(MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CreateFarm())),
                                            child: const Text('Create One',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline)))
                                      ]);
                                } else {
                                  return Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Farms',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Wrap(
                                                spacing: 10,
                                                children:
                                                    snapshot.data!.map((farm) {
                                                  return Chip(
                                                      backgroundColor: selectedFarms
                                                              .where((element) =>
                                                                  element ==
                                                                  farm?.id)
                                                              .toList()
                                                              .isNotEmpty
                                                          ? Colors.green
                                                          : Colors
                                                              .grey.shade300,
                                                      deleteIconColor:
                                                          Colors.white,
                                                      deleteIcon: Icon(selectedFarms
                                                              .where((element) =>
                                                                  element ==
                                                                  farm?.id)
                                                              .toList()
                                                              .isNotEmpty
                                                          ? Icons.close
                                                          : Icons.add),
                                                      onDeleted: () {
                                                        setState(() {
                                                          if (selectedFarms
                                                              .where(
                                                                  (element) =>
                                                                      element ==
                                                                      farm?.id)
                                                              .toList()
                                                              .isNotEmpty) {
                                                            selectedFarms.remove(
                                                                selectedFarms
                                                                    .where((element) =>
                                                                        element ==
                                                                        farm?.id)
                                                                    .first);
                                                          } else {
                                                            selectedFarms.add(
                                                                farm?.id ?? '');
                                                          }
                                                        });
                                                      },
                                                      label: Text('${farm?.name}',
                                                          style: TextStyle(
                                                              color: selectedFarms
                                                                      .where((element) => element == farm?.id)
                                                                      .toList()
                                                                      .isNotEmpty
                                                                  ? Colors.white
                                                                  : Colors.black)));
                                                }).toList())
                                          ]));
                                }
                              } else {
                                return const LinearProgressIndicator();
                              }
                            })
                      ]))),
              Container(
                  width: width,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        final tasks = TasksEntity.initial().copyWith(
                            farms: selectedFarms,
                            startTime: startDateTime.value,
                            endTime: endDateTime.value,
                            status: selectedStatus,
                            description: description,
                            name: title);
                        await showDialog<void>(
                            context: context,
                            builder: (context) => LoadingPage(
                                errorText: taskBloc.createTaskBloc(tasks),
                                callback: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Tasks has been created successfully')));
                                  // Navigator.of(context).push(MaterialPageRoute<void>(
                                  //     builder: (context) => const HomeScreen()));
                                }));
                      },
                      child: const Text('Create Task')))
            ]))));
  }
}
