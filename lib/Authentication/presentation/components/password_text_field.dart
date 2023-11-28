// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          icon: Icon(
            isObscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: isObscureText,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return "يجب كتابة كلمة المرور";
        }
        return null;
      },
    );
  }
}
