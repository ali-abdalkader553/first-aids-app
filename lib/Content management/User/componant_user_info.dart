import 'package:flutter/material.dart';

Widget buildTextFormFiled({
  IconData? prefix,
  required String? label,
  required Function validat,
  required control,
  GestureTapCallback? onTap,
  TextInputType? text,
  double border = 20.0,
  double? Width,
}) =>
    Container(
      width: Width,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(border),
          ),
          prefixIcon: Icon(
            prefix,
          ),
          labelText: label,
          errorMaxLines: 2,
        ),
        textAlign: TextAlign.start,
        keyboardType: text,
        validator: (String? s) {
          return validat(s);
        },
        controller: control,
        onTap: () {
          onTap!();
        },
      ),
    );

Widget buildTextBottom({
  required Function onPressed,
  required String text,
  double radius = 0,
  double width = 0,
  Color? color,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void nextPage(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
