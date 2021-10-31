import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo/adapters/todo_adapter.dart';
import 'package:todo/views/add_todo.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lime,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "ToDo",
          style: TextStyle(
            color: Colors.lime,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: ValueListenbleBuilder(),
    );
  }
}

class ValueListenbleBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Todo>('todos').listenable(),
      builder: (context, Box<Todo> box, _) {
        if (box.values.isEmpty) {
          return Center(
            child: Text("No data available!",
                style: TextStyle(fontFamily: 'Montserrat')),
          );
        }
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            Todo todo = box.getAt(index);
            return ListTile(
              onLongPress: () async {
                await box.deleteAt(index);
              },
              title: Text(
                todo.title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                // DateFormat('dd MMM yyyy').format(todo.date) +
                "Start : " +
                    todo.start.toString() +
                    "\n" +
                    "End   : " +
                    todo.end.toString() +
                    "\n" +
                    todo.description,
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        );
      },
    );
  }
}
