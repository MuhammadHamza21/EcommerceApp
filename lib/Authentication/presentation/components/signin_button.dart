// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: FaIcon(icon),
        label: Text(title),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
        ),
      ),
    );
  }
}
