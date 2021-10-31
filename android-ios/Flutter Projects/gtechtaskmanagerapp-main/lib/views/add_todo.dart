import 'dart:ui';
// import 'package:googleapis/sheets/v4.dart';
import 'package:hive/hive.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:googleapis/calendar/v3.dart';

import 'package:todo/adapters/todo_adapter.dart';

import '../CalendarClient.dart';
import '../widgets/PickDateButton.dart';

class AddTodo extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  CalendarClient calendarClient = CalendarClient();
  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now().add(Duration(hours: 1));
  String title = 'No title';
  String description = 'No description';

  submitData() async {
    if (widget.formkey.currentState.validate()) {
      Box<Todo> todoBox = Hive.box<Todo>('todos');
      todoBox.add(
        Todo(
          title: title,
          description: description,
          start: _start,
          end: _end,
        ),
      );
      Navigator.of(context).pop();
      calendarClient.insert(
        title,
        _start,
        _end,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: customAppBar(context),
      body: Container(
        child: Form(
          key: widget.formkey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: '   Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '   Description',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      _start == null
                          ? 'Start : '
                          : 'Start : \n' +
                              DateFormat("h:mm a, dd MMM yyyy").format(_start),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime:
                                    DateTime.now().add(Duration(days: 364)),
                                currentTime: DateTime.now(),
                                locale: LocaleType.en)
                            .then((value) {
                          setState(() {
                            _start = value;
                          });
                        });
                      },
                      child: PickDateButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      _end == null
                          ? 'End : '
                          : 'End : \n' +
                              DateFormat("h:mm a, dd MMM yyyy").format(_end),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: _start.add(Duration(minutes: 1)),
                                maxTime:
                                    DateTime.now().add(Duration(days: 365)),
                                currentTime: _start.add(Duration(hours: 1)),
                                locale: LocaleType.en)
                            .then((value) {
                          setState(() {
                            _end = value;
                          });
                        });
                      },
                      child: PickDateButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(10),
                ),
                onPressed: submitData,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                ' Tip: You can long press on a task to delete it!',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.black,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        "Add task",
        style: TextStyle(
          color: Colors.lime,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }
}
