import 'package:flutter/material.dart';

import '../widgets/back_button.dart';
import '../widgets/my_text_field.dart';
import '../widgets/top_container.dart';

class CreateNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              height: 300,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const MyTextField(label: 'Title'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.calendar_today,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Expanded(
                          child: MyTextField(
                        label: 'Start Time',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const MyTextField(
                    label: 'Description',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Farms',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Wrap(
                          //textDirection: TextDirection.rtl,
                          spacing: 10,
                          children: const <Widget>[
                            Chip(
                              label: Text('SPORT APP'),
                              backgroundColor: Colors.red,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            Chip(
                              label: Text('MEDICAL APP'),
                            ),
                            Chip(
                              label: Text('RENT APP'),
                            ),
                            Chip(
                              label: Text('NOTES'),
                            ),
                            Chip(
                              label: Text('GAMING PLATFORM APP'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
                width: width,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Create Task'))),
          ],
        ),
      ),
    );
  }
}
