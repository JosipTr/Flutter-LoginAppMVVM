import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String _text;
  final Function _function;
  const MyRichText(this._text, this._function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _text,
            style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Colors.blue),
            recognizer: TapGestureRecognizer()
          ..onTap = () => _function()
          )
        ]
      ),
    );
  }
}