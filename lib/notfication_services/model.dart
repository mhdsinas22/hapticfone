import 'package:hive/hive.dart';

part 'model.g.dart'; // Required for the generated TypeAdapter

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;
  @HiveField(2)
  String itemcount;
  Task(
      {required this.title,
      required this.description,
      required this.itemcount});
}
