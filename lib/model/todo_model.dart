import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class Todo extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final bool todoChecker;

  @HiveField(4)
  final String date;

  const Todo({
    required this.id,
    required this.title,
    required this.body,
    required this.todoChecker,
    required this.date,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? body,
    bool? todoChecker,
    String? date,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      todoChecker: todoChecker ?? this.todoChecker,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [id, title, body, todoChecker, date];
}
