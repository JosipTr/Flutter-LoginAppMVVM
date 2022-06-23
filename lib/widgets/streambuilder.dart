import 'package:flutter/material.dart';
import 'package:tutorial/view/home_view.dart';
import 'package:tutorial/view/login_view.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';

class MyStreamBuilder extends StatefulWidget {
  const MyStreamBuilder({Key? key}) : super(key: key);

  @override
  State<MyStreamBuilder> createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseAuthViewModel.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeView();
        } else {
          return const LoginView();
        }
      }
    );
  }
}