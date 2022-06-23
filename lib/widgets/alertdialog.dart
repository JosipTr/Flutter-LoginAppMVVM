import 'package:flutter/material.dart';
import 'package:tutorial/assets/strings/strings.dart';

class MyAlertDialog extends StatelessWidget {
  final String _text;
  final Function _function;
  const MyAlertDialog(this._text, this._function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(_text),
        actions: [
          TextButton(child: const Text(Strings.affirmative), onPressed: () => _function())
        ],
      ),
    );
  }
}