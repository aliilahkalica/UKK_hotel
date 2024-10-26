import 'package:flutter/material.dart';

class ShowAlert extends StatelessWidget {
  final String title;
  final String message;
  const ShowAlert({super.key, required this.message, this.title = 'Error'});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}
