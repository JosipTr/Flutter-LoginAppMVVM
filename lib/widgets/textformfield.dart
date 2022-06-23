
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String _hintText;
  final TextEditingController _textController;
  final Function _function;
  final bool _isObscured;
  const MyTextFormField(this._hintText, this._isObscured, this._textController, this._function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      validator: (value) => _function(),
      obscureText: _isObscured,
      style: const TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        hintText: _hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
      ),
    );
  }
}