import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String _text;
  final Function _function;
  const MyElevatedButton(this._text, this._function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _function(),
      child: Text(_text),
    );
  }
}