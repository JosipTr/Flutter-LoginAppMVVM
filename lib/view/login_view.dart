import 'package:flutter/material.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/elevatedbutton.dart';
import 'package:tutorial/widgets/textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

  Future _logIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    try {
      await _firebaseAuthViewModel.signInWithEmailAndPassword(email, password);
    } catch (e) {
      print("Hello world");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(_emailController),
            MyTextField(_passwordController),
            MyElevatedButton("LogIn", _logIn)
          ],
        ),
      ),
    );
  }
}