import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/hive_database.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());

  final hiveDatebase = HiveDatabase();
  await hiveDatebase.openBox();

  runApp(MyApp(hiveDatabase: hiveDatebase));
}

class MyApp extends StatelessWidget {
  final HiveDatabase? _hiveDatabase;
  const MyApp({Key? key, HiveDatabase? hiveDatabase})
      : _hiveDatabase = hiveDatabase,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _hiveDatabase,
      child: BlocProvider(
        create: (context) =>
            TodoBloc(hiveDatabase: _hiveDatabase!)..add(LoadTodo()),
        child: MaterialApp(
          title: 'Todo App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: const MaterialColor(
              0xFF000A1F,
              <int, Color>{
                50: Color(0xFF000A1F),
                100: Color(0xFF000A1F),
                200: Color(0xFF000A1F),
                300: Color(0xFF000A1F),
                400: Color(0xFF000A1F),
                500: Color(0xFF000A1F),
                600: Color(0xFF000A1F),
                700: Color(0xFF000A1F),
              },
            ),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
