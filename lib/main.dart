import 'package:flutter/material.dart';
import 'package:heros/views/detail/detail_view.dart';
import 'package:heros/views/home/home_view.dart';
import 'package:heros/views/splash/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel heros',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/splash': (context) => Splash(),
        '/home': (context) => HomeView(),
        '/detail': (context) => DetailView(
              idCharacter: ModalRoute.of(context).settings.arguments,
            ),
      },
      initialRoute: '/splash',
    );
  }
}
