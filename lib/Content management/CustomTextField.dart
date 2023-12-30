import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hittext;
  final TextEditingController addconroller;
  final String?Function(String?)? validator;

  const CustomTextField({Key? key, required this.hittext, required this.addconroller, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: addconroller,
      decoration: InputDecoration(
        hintText: hittext,
        hintStyle: TextStyle(fontSize: 15,color: Colors.black26),
        contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black26),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black26),
        ),

      ),

    );
  }
}
