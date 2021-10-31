import 'package:hive/hive.dart';

part 'todo_adapter.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(3)
  DateTime start;
  @HiveField(4)
  DateTime end;

  Todo({
    this.title,
    this.description,
    this.start,
    this.end,
  });
}
