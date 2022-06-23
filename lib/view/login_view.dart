import 'package:flutter/material.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/circular_indicator.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _logIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const CircularIndicator()
    );

    try {
      await _firebaseAuthViewModel.signInWithEmailAndPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid e-mail or password")));
    }
    if (!mounted) return;
    Navigator.of(context).pop();
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