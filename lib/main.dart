import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/todoadapter.dart';
import 'package:todo/todo_services.dart';
import 'package:todo/todohomepage.dart';
import 'package:hive/hive.dart';
import 'package:todo/todolist_model.dart';
import 'package:todo/todolist_services.dart';

import 'box.dart';



void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoadapterAdapter());
  boxPersons = await Hive.openBox<Todoadapter>('personBox');
  //var bo = await Hive.openBox('testBox');

  
 // await Hive.openBox<TodoModel>('todobox');


  runApp(const MyApp());
}
// @HiveType(typeId: 0)
// @HiveType(typeId: 1)






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => MovieService()),
        ChangeNotifierProvider(create: (_) => TodolistServices()),
      ],
      child: ValueListenableBuilder(
        valueListenable: Hive.box<Todoadapter>('personBox').listenable(),
        builder: (context, value, child) {
          //bool theme = value.get('theme', defaultValue: true);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Homepage(),
          );
        },
      ),
    );
  }
}
