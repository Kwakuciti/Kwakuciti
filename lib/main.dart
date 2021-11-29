import 'package:flutter/material.dart';
import 'package:todo_app/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600, ), 
        ),
        
      ),
      darkTheme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white ),
          titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, 
          fontSize: 25 ),
        )
      ),
      themeMode: ThemeMode.dark,
      home: HomeView(),
    );
  }
}
