import 'package:controle/auth.dart';
import 'package:controle/pages/home_page.dart';
import 'package:controle/pages/login_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapchot) {
        if (!snapchot.hasData) {
          return LoginPage();
        } else {
          return HomePage();
        }
      },
    );
  }
}
