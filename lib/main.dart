import 'package:controle/colors/palette.dart';
import 'package:controle/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App controle financeiro',
      theme: ThemeData(
          scaffoldBackgroundColor: Palette.scaffoldBackgroundCOlor,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(backgroundColor: Palette.appBarColor)),
      home: WidgetTree(),
    );
  }
}
