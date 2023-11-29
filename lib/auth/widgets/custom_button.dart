import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: style.colorScheme.primary,
        ),
        height: 45,
        child: Center(
          child: Text(text,
              style: TextStyle(
                fontSize: 16,
                color: style.colorScheme.onPrimary,
              )),
        ),
      ),
    );
  }
}
