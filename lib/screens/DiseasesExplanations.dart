import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiseasesExplanations extends StatefulWidget {
  const DiseasesExplanations({Key? key}) : super(key: key);

  @override
  State<DiseasesExplanations> createState() => _DiseasesExplanationsState();
}

class _DiseasesExplanationsState extends State<DiseasesExplanations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('The informations of diseases'),
      ),
    );
  }
}
