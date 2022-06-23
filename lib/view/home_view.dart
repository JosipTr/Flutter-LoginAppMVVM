import 'package:flutter/material.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/elevatedbutton.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

  Future _logOut() async{
    await _firebaseAuthViewModel.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyElevatedButton("logOut", _logOut)
          ],
        ),
      ),
    );
  }
}