
import 'package:flutter/material.dart';
import 'package:tutorial/widgets/alertdialog.dart';
import 'package:tutorial/widgets/circular_indicator.dart';

Future showCircularDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const CircularIndicator()
  );
}

Future showAlertDialog(String text, Function function, {required BuildContext context}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) =>  MyAlertDialog(text, function)
  );
}