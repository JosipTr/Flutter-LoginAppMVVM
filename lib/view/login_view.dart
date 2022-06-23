import 'package:flutter/material.dart';
import 'package:tutorial/assets/strings/strings.dart';
import 'package:tutorial/logic/logic.dart';
import 'package:tutorial/view/register_view.dart';
import 'package:tutorial/view/reset_pass_view.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/elevatedbutton.dart';
import 'package:tutorial/widgets/richtext.dart';
import 'package:tutorial/widgets/textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bool _isObscured = true;
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

    showCircularDialog(context);

    try {
      await _firebaseAuthViewModel.signInWithEmailAndPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(Strings.invalid)));
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _register() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterView()));
  }

  void _forgotPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child:
                  const SizedBox(width: 200, height: 173, child: FlutterLogo()),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: MyTextField(
                  Strings.emailHint, !_isObscured, _emailController),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: MyTextField(
                    Strings.passHint, _isObscured, _passwordController)),
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: MyElevatedButton(Strings.login, _logIn)),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: MyRichText(Strings.forgotPass, _forgotPassword),
            ),
            MyRichText(Strings.dontHaveAcc, _register),
          ],
        ),
      ),
    );
  }
}
