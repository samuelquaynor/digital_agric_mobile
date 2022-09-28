import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/weather/presentation/pages/full_weather_screen.dart';
import '../../../../core/weather/presentation/widgets/display_weather_widget.dart';
import '../../../../injection_container.dart';
import '../../../tasks/domain/entities/tasks_entity.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../bloc/farms_bloc.dart';

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
  final bloc = sl<FarmsBloc>();

  List<TasksEntity?> tasks = <TasksEntity>[];

  Future<void> loadUser() async {
    final loadedTasks = await bloc.getTasksBloc();
    setState(() {
      tasks = loadedTasks.where((element) {
        final tasksRe = <TasksEntity?>[];
        for (var i = 0; i < int.parse('${element?.farms.length ?? 0}'); i++) {
          if (element?.farms[i] == widget.farm.id) {
            tasksRe.add(element);
          }
        }
        // ignore: avoid_bool_literals_in_conditional_expressions
        return tasksRe.isNotEmpty ? true : false;
      }).toList();
    });
    return;
  }

  List<CropInfo?> fullCrops = [];

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(LoadCustomWeatherLocation(
        latitude: widget.farm.latitude, longitude: widget.farm.longitude));
    return Scaffold(
        body: DraggableHome(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900),
                onPressed: () => Navigator.of(context).pop()),
            headerExpandedHeight: 0.45,
            title: Text(widget.farm.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            alwaysShowLeadingAndAction: true,
            actions: [
              IconButton(
                  onPressed: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (context) => LoadingPage(
                            errorText: bloc.deleteFarmBloc(widget.farm),
                            callback: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Farm has been deleted successfully')));
                              Navigator.of(context).pop();
                            }));
                  },
                  icon: const Icon(Icons.delete, color: Colors.white, size: 22))
            ],
            headerWidget: FutureBuilder<String?>(
                initialData: '',
                future: bloc.getFarmAvatarUrl(widget.farm.avatar ?? ''),
                builder: (context, avatarSnapshot) {
                  return SafeArea(
                      child: FadeInImage(
                          fit: BoxFit.contain,
                          imageErrorBuilder: (context, error, stackTrace) =>
                              DecoratedBox(
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/farm.jpg')),
                                      borderRadius: BorderRadius.circular(15))),
                          placeholder:
                              const AssetImage('assets/images/farm.jpg'),
                          image: NetworkImage(avatarSnapshot.requireData == ''
                              ? 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                              : '${avatarSnapshot.requireData}')));
                }),
            body: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                    if (state is WeatherLoading) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()));
                    } else if (state is WeatherLoaded) {
                      return GestureDetector(
                          onTap: () => Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                  builder: (context) => WeatherScreen(
                                      weather: state.weather!,
                                      forecast: state.forecast))),
                          child: DisplayWeather(weather: state.weather!));
                    } else {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text('Weather Loading Error'));
                    }
                  })),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Farm Crops',
                            style: Theme.of(context).textTheme.titleMedium),
                        FutureBuilder<List<CropInfo?>>(
                            future: bloc.getCropInfoBloc(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const LinearProgressIndicator();
                              } else {
                                for (var i = 0;
                                    i <
                                        int.parse(
                                            '${snapshot.data?.length ?? 0}');
                                    i++) {
                                  if (widget.farm.crops.firstWhere(
                                          (element) =>
                                              element?.id ==
                                              snapshot.data?[i]?.id,
                                          orElse: CropInfo.initial) !=
                                      CropInfo.initial()) {
                                    fullCrops.add(snapshot.data?[i]);
                                  }
                                }
                                if (fullCrops.isNotEmpty) {
                                  return SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              Container(
                                                  width: 120,
                                                  height: 120,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.green
                                                                .withOpacity(
                                                                    0.2),
                                                            blurRadius: 5,
                                                            spreadRadius: 3,
                                                            offset:
                                                                const Offset(
                                                                    0, 5))
                                                      ]),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: FadeInImage(
                                                        imageErrorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                                'assets/images/rice.png',
                                                                fit: BoxFit
                                                                    .cover),
                                                        fit: BoxFit.cover,
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/images/rice.png'),
                                                        image: NetworkImage(
                                                            fullCrops[index]
                                                                    ?.photoUrl ??
                                                                '',
                                                            scale: 1.5)),
                                                  )),
                                              Text('${fullCrops[index]?.name}')
                                            ]);
                                          },
                                          itemCount: fullCrops.length,
                                          scrollDirection: Axis.horizontal));
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                        child: Text(
                                            'No Crops Available For This Farm')),
                                  );
                                }
                              }
                            })
                      ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Farm Tasks',
                            style: Theme.of(context).textTheme.titleMedium),
                        if (tasks.isNotEmpty)
                          ListView.builder(
                              itemCount: tasks.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 70,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.2),
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
                                                        builder: (context) =>
                                                            LoadingPage(
                                                                errorText: bloc
                                                                    .deleteTaskBloc(
                                                                        tasks[
                                                                            index]!)));
                                                  },
                                                  backgroundColor:
                                                      const Color(0xFFFE4A49),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.delete,
                                                  label: 'Delete')
                                            ]),
                                        child: ListTile(
                                            title: Text(
                                                toBeginningOfSentenceCase(
                                                        tasks[index]?.name) ??
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                            subtitle: Text(
                                                toBeginningOfSentenceCase(
                                                        tasks[index]?.description) ??
                                                    '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(color: Colors.white)))));
                              })
                        else
                          const Center(
                              child: Text('No Tasks Available For This Farm'))
                      ]))
            ]));
  }
}
