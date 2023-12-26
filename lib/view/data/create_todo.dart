import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/model/todo_model.dart';

class CreateTodo extends StatefulWidget {
  final Todo? todo;
  const CreateTodo({super.key, this.todo});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  Random random = Random();
  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      bodyController.text = widget.todo!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  Image.asset(
                    'asset/img/note.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    widget.todo != null ? 'Edit Your Task' : 'Add New Task',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'You can always change your plan, but only if you have one......have a list of what I want to achieve',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  TextField(
                    controller: titleController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Todo title',
                      //labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: bodyController,
                    minLines: 6,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter text',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.todo != null ? "Edit Task" : 'Add Task',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (widget.todo != null) {
                          context.read<TodoBloc>().add(
                                UpdateTodo(
                                  todo: widget.todo!.copyWith(
                                    title: titleController.text,
                                    body: bodyController.text,
                                  ),
                                ),
                              );
                        } else {
                          DateTime dates = DateTime.now();
                          Todo addtodo = Todo(
                            id: '${random.nextInt(10000)}',
                            title: titleController.text,
                            body: bodyController.text,
                            todoChecker: false,
                            date:
                                "${dates.hour}:${dates.minute}:${dates.second}",
                          );
                          context.read<TodoBloc>().add(AddTodo(todo: addtodo));
                        }
                      } else {
                        return;
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        widget.todo != null ? Icons.edit : Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
