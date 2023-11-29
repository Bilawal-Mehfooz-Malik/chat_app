import 'package:flutter/material.dart';

const border =
    BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero));

void showSnack({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}

void showErrorDialog({required BuildContext context, required String content}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
        shape: border,
      );
    },
  );
}

void showCircularDialog({required BuildContext context, required String text}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return Dialog(
        shape: border,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 30,
          ),
          child: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 12),
              Text(text),
            ],
          ),
        ),
      );
    },
  );
}
