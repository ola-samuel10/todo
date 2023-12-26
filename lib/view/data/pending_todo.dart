import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/view/data/create_todo.dart';

class PendingTodo extends StatelessWidget {
  const PendingTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TodoLoaded) {
          if (state.todo.isEmpty ||
              state.todo.where((item) => item.todoChecker == false).isEmpty) {
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    'asset/img/note.png',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'No Completed Task',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(2),
              shrinkWrap: true,
              itemCount:
                  state.todo.where((item) => item.todoChecker == false).length,
              itemBuilder: (context, index) {
                var todo1 = state.todo
                    .where((item) => item.todoChecker == false)
                    .toList()[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<TodoBloc>().add(
                                  UpdateTodo(
                                    todo: todo1.copyWith(
                                      todoChecker: !todo1.todoChecker,
                                    ),
                                  ),
                                );
                          },
                          child: CircleAvatar(
                            backgroundColor: todo1.todoChecker == true
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Container(
                          height: 82,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 218, 216, 216),
                                spreadRadius: 0.2,
                                blurRadius: 2,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todo1.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            todo1.body,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          showDragHandle: true,
                                          elevation: 0,
                                          context: context,
                                          builder: (_) {
                                            return CreateTodo(todo: todo1);
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<TodoBloc>().add(
                                        DeleteTodo(todo: state.todo[index]),
                                      );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: todo1.todoChecker == true
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.delete, color: Colors.white),
                                      Text(
                                        'delete',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          todo1.date,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }
}
