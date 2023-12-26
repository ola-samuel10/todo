import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/todo_model.dart';

class HiveDatabase {
  String boxName = 'todo_box';

  Future<Box> openBox() async {
    Box box = await Hive.openBox<Todo>(boxName);
    return box;
  }

  List<Todo> getTodo(Box box) {
    return box.values.toList().cast<Todo>();
  }

  Future<void> addTodo(Box box, Todo todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> updateTodo(Box box, Todo todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(Box box, Todo todo) async {
    await box.delete(todo.id);
  }

  Future<void> deleteAllTodo(Box box) async {
    await box.clear();
  }
}
