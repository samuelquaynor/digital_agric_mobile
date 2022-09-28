import 'package:flutter/material.dart';

import '../widgets/back_button.dart';
import '../widgets/calendar_dates.dart';
import '../widgets/dates_list.dart';
import '../widgets/task_container.dart';

/// Calendar Page
class CalendarPage extends StatelessWidget {
  /// Constructor
  const CalendarPage({super.key});

  Widget _dashedText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: const Text(
        '------------------------------------------',
        maxLines: 1,
        style: TextStyle(fontSize: 20, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              const MyBackButton(),
              const SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('Today',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700))
                  ]),
              const SizedBox(height: 10),
              Row(
                children: const <Widget>[
                  Text(
                    'Productive Day, Sourav',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'April, 2020',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 58,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 0 ? Colors.red : Colors.black54,
                      dateColor:
                          index == 0 ? Colors.red : Colors.green.shade900,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Project Research',
                                subtitle:
                                    'Discuss with the colleagues about the future plan',
                                boxColor: Colors.yellow.shade200,
                              ),
                              _dashedText(),
                              const TaskContainer(
                                title: 'Work on Medical App',
                                subtitle: 'Add medicine tab',
                                boxColor: Color(0xFFD5E4FE),
                              ),
                              const TaskContainer(
                                title: 'Call',
                                subtitle: 'Call to david',
                                boxColor: Color(0xFFFED4D6),
                              ),
                              const TaskContainer(
                                title: 'Design Meeting',
                                subtitle:
                                    'Discuss with designers for new task for the medical app',
                                boxColor: Color(0xFFD5E4FE),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
