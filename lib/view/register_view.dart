import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/assets/strings/strings.dart';
import 'package:tutorial/viewmodel.dart/firebaseauth_vievmodel.dart';
import 'package:tutorial/widgets/elevatedbutton.dart';
import 'package:tutorial/widgets/textformfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final bool _isObscured = true;
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPassTextController.dispose();
    super.dispose();
  }

  // Future _register() async {
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();

  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const CircularIndicator());

  //   try {
  //     await _firebaseAuthViewModel.createUserWithEmailAndPassword(
  //         email, password);
  //         if (!mounted) return;
  //         Navigator.pop(context);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("User already exist")));
  //   }
  //   if (!mounted) return;
  //   Navigator.pop(context);
  // }

    Future _register() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();



    if (_formKey.currentState!.validate()) {
      try {
        await _firebaseAuthViewModel.createUserWithEmailAndPassword(
            email, password);
        _emailTextController.clear();
        _passwordTextController.clear();
        _confirmPassTextController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.userExist)));
      }
    }
  }

  String? _validateEmail() {
    String email = _emailTextController.text.trim();
    if (!EmailValidator.validate(email)) {
      return Strings.invalidEmail;
    } else {
      return null;
    }
  }

  String? _validatePassword() {
    String password = _passwordTextController.text.trim();
    if (password.length < 6) {
      return Strings.invalidPassword;
    } else {
      return null;
    }
  }

  String? _validateConfirmedPass() {
    String password = _passwordTextController.text.trim();
    String confirmPass = _confirmPassTextController.text.trim();
    if (password != confirmPass) {
      return Strings.passDontMatch;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child:
                  const SizedBox(width: 200, height: 173, child: FlutterLogo()),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: MyTextFormField(Strings.emailHint, !_isObscured,
                  _emailTextController, _validateEmail),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: MyTextFormField(Strings.passHint, _isObscured,
                    _passwordTextController, _validatePassword)),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: MyTextFormField(Strings.confirmPass, _isObscured,
                    _confirmPassTextController, _validateConfirmedPass)),
            MyElevatedButton(Strings.register, _register)
          ],
        ),
      ),
    )
    );
  }
}
