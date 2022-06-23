
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial/assets/strings/strings.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/alertdialog.dart';
import 'package:tutorial/widgets/circular_indicator.dart';
import 'package:tutorial/widgets/elevatedbutton.dart';
import 'package:tutorial/widgets/streambuilder.dart';
import 'package:tutorial/widgets/textfield.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _isObscured = false;
  final _firebaseAuthViewModel = FirebaseAuthViewModel();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _exit() {
    if (!mounted) return;
    Navigator.pop(context);
  }

    void _navigate() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyStreamBuilder()), (route) => false);
  }

  Future _resetPassword() async {
    final String email = _emailController.text.trim();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CircularIndicator());

    try {
      await _firebaseAuthViewModel.sendPasswordResetEmail(email);
      _emailController.clear();
      _exit();
      showDialog(context: context, builder: (context) => MyAlertDialog(Strings.passReseted, _navigate));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(Strings.invalidEmail)));
      _emailController.clear();
      _exit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child:
                  MyTextField(Strings.emailHint, _isObscured, _emailController),
            ),
            MyElevatedButton(Strings.resetPassword, _resetPassword)
          ],
        )),
      ),
    );
  }
}
