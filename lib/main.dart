import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo_services.dart';
import 'package:todo/todohomepage.dart';
import 'package:hive/hive.dart';
import 'package:todo/todolist_services.dart';


class User {
  String name;

  User(this.name);

  @override
  String toString() => name; // Just for print()
}
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');

  var bo = await Hive.openBox('testBox');

  bo.put('name', 'David');
  bo.put('name', 'samm');

  print('Name: ${bo.get('name')}');

   Hive.registerAdapter(UserAdapter());

  var box = await Hive.openBox<User>('userBox');

  box.put('david', User('David'));
  box.put('sandy', User('Sandy'));

  print(box.values);


  runApp(const MyApp());
}
@HiveType(typeId: 0)
@HiveType(typeId: 1)

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(reader.read());
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieService()),
        ChangeNotifierProvider(create: (_) => TodolistServices()),
      ],
      child: ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, value, child) {
          bool theme = value.get('theme', defaultValue: true);
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
