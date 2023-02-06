import 'package:controle/auth.dart';
import 'package:controle/colors/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle/models/categorias.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late int index = _emailController.text.indexOf('@');
  late String username = _emailController.text.substring(0, index);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    print('Vai pro users');
    await users
        .add({
          'email': _emailController.text,
          'username': username,
          'conta': 0,
          'categorias': categorias.map((item) => item.toMap()).toList()
        })
        .then((value) => print('Deu bom'))
        .catchError((onError) => print('Deu ruim'));
  }

  Future<void> signIn() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createAccount() async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => addUser())
          .catchError((onError) => print('${onError}'));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? ${errorMessage}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Bem-Vindo!',
                  style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: _emailController,
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(labelText: 'Senha'),
                controller: _passwordController,
              ),
              SizedBox(
                height: 15,
              ),
              _errorMessage(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2, color: Color(0xFF303030)),
                  backgroundColor: Palette.scaffoldBackgroundCOlor,
                  fixedSize:
                      Size.fromWidth((MediaQuery.of(context).size.width)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: signIn,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF303030)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2, color: Palette.appBarColor),
                  backgroundColor: Palette.scaffoldBackgroundCOlor,
                  fixedSize:
                      Size.fromWidth((MediaQuery.of(context).size.width)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: createAccount,
                child: Text('Registrar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.appBarColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
