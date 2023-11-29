import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.autoCorrect = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool autoCorrect;
  final bool obscureText;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final VoidCallback onPressed;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.inputType,
      autocorrect: widget.autoCorrect,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: _isFocus
            ? IconButton(
                icon: Icon(widget.icon),
                onPressed: widget.onPressed,
              )
            : null,
        labelText: widget.text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
