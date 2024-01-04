import 'package:flutter/material.dart';

class CustomButtonUpload extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool isSelected;
  const CustomButtonUpload(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 40,
      minWidth: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: isSelected ? Colors.green : Colors.redAccent,
      textColor: Colors.white,
      child: Text(title),
    );
  }
}
