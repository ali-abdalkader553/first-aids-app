import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const CustomButton({Key? key, required this.onPressed ,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.redAccent,
      textColor: Colors.white,
      child: Text(title),
    );
  }
}
