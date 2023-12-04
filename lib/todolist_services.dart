import 'package:flutter/material.dart';
import 'package:todo/todolist_model.dart';

class TodolistServices extends ChangeNotifier {
List<TodoModel> get todo => _todo;

  final List <TodoModel> _todo = [];

  void addTodo(TodoModel todo){

      _todo.add(todo);
      notifyListeners();
  }

  void deleteTodo(TodoModel todo){
    _todo.remove(todo);
    notifyListeners();
  }
  void updateTodo ( TodoModel todo){
     int index = _todo.indexWhere((element) => element.id == todo.id);
    _todo[index] = todo;
    notifyListeners();
  }

 

}