import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  const MyTextField(this._textEditingController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
    );
  }
}