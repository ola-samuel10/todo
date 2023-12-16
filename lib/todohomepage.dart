import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/todoadapter.dart';
import 'package:todo/todolist_model.dart';
import 'package:todo/todolist_services.dart';

import 'box.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> name = [
    'All',
    'Completed',
    'Pending',
    'Date',
  ];

  int seletesCategories = 0;
  //  List _todos = [];
  // final addedsTodo  = Hive.box('settings');

  // @override
  // void initState() {
  //  // _refreshTodo();
  //   // TODO: implement initState
  //   super.initState();
  // }

// void _refreshTodo({title, body}){
//   final data = addedsTodo.keys.map((key)  {
//      Random random = Random();
//     DateTime dates = DateTime.now();
// final todos =addedsTodo.get(key);
// print("hello mmii");

// print(_todos);
// return {
//   'key': key, 'title': todos['title'], "body": todos["body"]
// };
//   }).toList();
//   print(data);
//   print("hello hii");
//   setState(() {
//     _todos = data.reversed.toList();
//     print(_todos.length);
//   });
// }
// Future<void> _createdTodo(Map<String, dynamic> newtodo) async {
//     await addedsTodo.add(newtodo);
//     print(addedsTodo);
//     print('hiii${addedsTodo.length}');
//    // _refreshTodo( );
//   }

  @override
  Widget build(BuildContext context) {
    List categories = [
      all(),
      completed(),
      pending(),
      date(),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!!!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "My Todo List",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  CircleAvatar(
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),
            Consumer<TodolistServices>(
              builder: (context, state, index) {
                // 30/09/2021

                var value =
                    state.todo.where((item) => item.todoChecker == true).length;
                var values = state.todo
                    .where((item) => item.todoChecker == false)
                    .length;

                //bool todo = state.todo[index].todoChecker == true;
                print(value);
                print(values);
                // todo.forEach((element) {

                //  // i ==  todo.where((element) => true).length;
                //   element.body == "fjffj";
                //   element.todoChecker == true;
                //    });s
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      DateTime now = DateTime.now();
                      // DateTime date = DateTime(now.year, now.month, now.day);
                      //   final List <TodoModel> todo = [];

                      //  // var i = todo.where((x){  } ).length;
                      //   var v = todo.indexWhere(( element) => element.todoChecker == true).round();
                      //   var k = todo.indexWhere(( element) => element.todoChecker == false).bitLength + 1;

                      // for (var i in state.todo) {
                      //   i == todo.todoChecker;

                      // //  for ( var n in todo.todoChecker ){

                      // //  }
                      // }

                      // for ( var i in state.todo ){
                      //       todo.todoChecker == true ;
                      //       i = todo.todoChecker.
                      // }
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          //height: 220,
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            //runAlignment: WrapAlignment.spaceAround ,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Active Todo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        state.todo.length.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'All added task',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Completed Todo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        value.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Completed todo task',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pending Todo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        values.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Task not done',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Todo Date',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${now.month}/'
                                        '${now.day}/'
                                        '${now.year}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'the calendar date',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  //height: 220,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    //runAlignment: WrapAlignment.spaceAround ,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Active Todo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '12',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'All created task',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Completed Todo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Completed todo task',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pending Todo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Task not done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Todo Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '  date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'the calendar date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              //margin: EdgeInsets.all(0),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Todo List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      createTodo();
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.add)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    name.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() => seletesCategories = index);
                          },
                          child: Column(
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: seletesCategories == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 7,
                                width: 40,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: seletesCategories == index
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: AssetImage('asset/img/back.jpg'))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      categories[seletesCategories],
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  all() {
    return Column(
      children: [
        Consumer<TodolistServices>(
          builder: (context, state, _) {
            List todo = [] ;
            if (todo.isEmpty) {
              return Center(
                  child: Column(
                children: [
                  Image.asset(
                    'asset/img/note.png',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'No Todo Task',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ));
            }
            if (todo.isNotEmpty) {
               
              return ListView.builder(
                padding: const EdgeInsets.all(2),
                shrinkWrap: true,
                itemCount: boxPersons.length,
                //itemCount: _todos.length,
                itemBuilder: (context, index) {
                  
                  Todoadapter todo1 = boxPersons.getAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // context.read<TodolistServices>().updateTodo(
                              //       todo.copyWith(
                              //         todoChecker: !todo.todoChecker,
                              //       ),
                              //     );
                            },
                            child: CircleAvatar(
                              backgroundColor: todo1.todoChecker! == true
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
                                      blurRadius: 2)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
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
                                              todo1.title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              todo1.body!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            createTodo(
                                              todo: todo,
                                              //context: context,
                                            );
                                          },
                                          icon: Icon(Icons.edit))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TodolistServices>()
                                        .deleteTodo(todo as TodoModel);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: todo1.todoChecker == true
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ],
    );
  }

  dat() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 218, 216, 216),
                    spreadRadius: 0.2,
                    blurRadius: 2)
              ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Holiday ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'i want to travel to space',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Text(
              '9:50. pm',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 218, 216, 216),
                    spreadRadius: 0.2,
                    blurRadius: 2)
              ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Holiday ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'i want to travel to space',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Text(
              '9:50. pm',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 218, 216, 216),
                    spreadRadius: 0.2,
                    blurRadius: 2)
              ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Holiday ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'i want to travel to space',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Text(
              '9:50. pm',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
      ],
    );
  }

  completed() {
    return Column(
      children: [
        Consumer<TodolistServices>(
          builder: (context, state, _) {
            if (state.todo.isEmpty ||
                state.todo.where((item) => item.todoChecker == true).length ==
                    0) {
              return Center(
                  child: Column(
                children: [
                  Image.asset(
                    'asset/img/note.png',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'No Completed  Task',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ));
            }
            if (state.todo.isNotEmpty) {
              return ListView.builder(
                padding: EdgeInsets.all(2),
                shrinkWrap: true,
                itemCount:
                    state.todo.where((item) => item.todoChecker == true).length,
                itemBuilder: (context, index) {
                  //TodoModel todo = state.todo.reversed.toList()[index];
                  TodoModel todo = state.todo
                      .where((item) => item.todoChecker == true)
                      .toList()[index];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<TodolistServices>().updateTodo(
                                    todo.copyWith(
                                      todoChecker: !todo.todoChecker!,
                                    ),
                                  );
                            },
                            child: CircleAvatar(
                              backgroundColor: todo.todoChecker! == true
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
                                      blurRadius: 2)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
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
                                              todo.title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              todo.body!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            createTodo(
                                              todo: todo,
                                              //context: context,
                                            );
                                          },
                                          icon: Icon(Icons.edit))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TodolistServices>()
                                        .deleteTodo(todo);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: todo.todoChecker == true
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            todo.date!,
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ],
    );
  }

  pending() {
    return Column(
      children: [
        Consumer<TodolistServices>(
          builder: (context, state, _) {
            if (state.todo.isEmpty ||
                state.todo.where((item) => item.todoChecker == false).length ==
                    0) {
              return Center(
                  child: Column(
                children: [
                  Image.asset(
                    'asset/img/note.png',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'No Pending Task',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ));
            }
            if (state.todo.isNotEmpty) {
              return ListView.builder(
                padding: EdgeInsets.all(2),
                shrinkWrap: true,
                itemCount: state.todo
                    .where((item) => item.todoChecker! == false)
                    .length,
                itemBuilder: (context, index) {
                  // TodoModel todo = state.todo.reversed.toList()[index];
                  TodoModel todo = state.todo
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
                              context.read<TodolistServices>().updateTodo(
                                    todo.copyWith(
                                      todoChecker: !todo.todoChecker!,
                                    ),
                                  );
                            },
                            child: CircleAvatar(
                              backgroundColor: todo.todoChecker == true
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
                                      blurRadius: 2)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
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
                                              todo.title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              todo.body!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            createTodo(
                                              todo: todo,
                                              //context: context,
                                            );
                                          },
                                          icon: Icon(Icons.edit))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TodolistServices>()
                                        .deleteTodo(todo);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: todo.todoChecker == true
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            todo.date!,
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ],
    );
  }

  date() {
    return Column(
      children: [
        TableCalendar(
          selectedDayPredicate: (day) {
            var _selectedDay = DateTime.now();
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              var _selectedDay = DateTime.now();
              var _focusedDay = DateTime.now();
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          calendarFormat: CalendarFormat.month,
          onFormatChanged: (format) {
            setState(() {
              format = format;
            });
          },
          firstDay: DateTime.utc(2010, 11, 16),
          lastDay: DateTime.utc(2030, 5, 14),
          focusedDay: DateTime.now(),
        )
      ],
    );
  }

  createTodo({
    todo,
  }) {
    Random random = Random();
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    if (todo != null) {
      titleController.text = todo.title;
      bodyController.text = todo.body;
    }

    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        elevation: 0,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
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
                        todo != null ? 'Edit Your Task' : 'Add New Task',
                        style: TextStyle(
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: bodyController,
                        minLines: 6,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          labelText: 'Enter text',
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //margin: EdgeInsets.all(0),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        todo != null ? "Edit Task" : 'Add Task',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (todo != null) {
                            context.read<TodolistServices>().updateTodo(
                                  todo.copyWith(
                                    title: titleController.text,
                                    body: bodyController.text,
                                  ),
                                );
                          } else if (titleController.text == '' ||
                              bodyController.text == '') {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('data')));
                            return;
                          } else {
                            setState(() {
                              DateTime dates = DateTime.now();

                              boxPersons.put(
                                  'key_${titleController.text}',
                                  Todoadapter(
                                      body: bodyController.text,
                                      id: random.nextInt(1000),
                                      date:
                                          "${dates.hour}:${dates.minute}:${dates.second}",
                                      title: titleController.text,
                                      todoChecker: false));
                            });

                            print(titleController.text);
                            //DateTime dates = DateTime.now();
                            // TodoModel todo = TodoModel(
                            //   TodoModel.new,
                            //   id: random.nextInt(1000),
                            //   title: titleController.text,
                            //   body: bodyController.text,
                            //   todoChecker: false,
                            //   date:
                            //       "${dates.hour}:${dates.minute}:${dates.second}",
                            // );

                            //context.read<TodolistServices>().addTodo(todo);
                            print(bodyController.text);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              todo != null ? Icons.edit : Icons.send,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
