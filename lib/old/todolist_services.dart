// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo/todolist_model.dart';

// //var tryagain = Hive.box('settings');

// class TodolistServices extends ChangeNotifier {
//   List<TodoModel> get todo => _todo;
  
//   final List<TodoModel> _todo = [];
//   //final List<TodoModel> todo1 = tryagain.get("todo", defaultValue: [] );

//   void addTodo(TodoModel todo) async {
//    print('hello');
//     _todo.add(todo);
//     print('object')   ;
//     //await tryagain.close();
//     //tryagain.put('todo', _todo);
     
//     notifyListeners();
//   }

//   void deleteTodo(TodoModel todo) {
//     _todo.remove(todo);
//    // tryagain.put('todo', _todo);
//     notifyListeners();
//   }

//   void updateTodo(TodoModel todo) {
//     int index = _todo.indexWhere((element) => element.id == todo.id);
//     _todo[index] = todo;
//    // tryagain.put('todo', _todo);
//     notifyListeners();
//   }
// }
