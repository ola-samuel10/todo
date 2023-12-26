import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/hive_database.dart';
import 'package:todo/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final HiveDatabase hiveDatabase;
  TodoBloc({required this.hiveDatabase}) : super(TodoLoading()) {
    on<LoadTodo>(_onLoadTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<DeleteAllTodo>(_onDeleteAllTodo);
  }

  void _onLoadTodo(
    LoadTodo event,
    Emitter<TodoState> emit,
  ) async {
    Future.delayed(const Duration(seconds: 1));
    Box box = await hiveDatabase.openBox();
    List<Todo> todo = hiveDatabase.getTodo(box);
    emit(TodoLoaded(todo: todo));
  }

  void _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodoState> emit,
  ) async {
    Box box = await hiveDatabase.openBox();
    if (state is TodoLoaded) {
      await hiveDatabase.updateTodo(box, event.todo);
      emit(TodoLoaded(todo: hiveDatabase.getTodo(box)));
    }
  }

  void _onAddTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) async {
    Box box = await hiveDatabase.openBox();
    if (state is TodoLoaded) {
      await hiveDatabase.addTodo(box, event.todo);
      emit(TodoLoaded(todo: hiveDatabase.getTodo(box)));
    }
  }

  void _onDeleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) async {
    Box box = await hiveDatabase.openBox();
    if (state is TodoLoaded) {
      hiveDatabase.deleteTodo(box, event.todo);
      emit(TodoLoaded(todo: hiveDatabase.getTodo(box)));
    }
  }

  void _onDeleteAllTodo(
    DeleteAllTodo event,
    Emitter<TodoState> emit,
  ) async {
    Box box = await hiveDatabase.openBox();
    if (state is TodoLoaded) {
      hiveDatabase.deleteAllTodo(box);
      emit(TodoLoaded(todo: hiveDatabase.getTodo(box)));
    }
  }
}
