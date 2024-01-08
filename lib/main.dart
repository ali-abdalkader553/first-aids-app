import 'package:firebase_core/firebase_core.dart';
import 'package:first_aids_app_pro1/Content%20management/Add_Diseases.dart';
import 'package:first_aids_app_pro1/Content%20management/Add_First_Aids.dart';
import 'package:first_aids_app_pro1/Content%20management/Add_Number.dart';
import 'package:first_aids_app_pro1/Content%20management/Add_explanation.dart';
import 'package:first_aids_app_pro1/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "addfirstaid": (context) => Add_First_Aids(),
        "addnumber": (context) => Add_Number(),
        "addexplanation": (context) => Add_Explanation(
              docid: 'widget.docid',
            ),
        "adddiseases": (context) => Add_Diseases(
              docid: 'widget.diseasesid',
            ),
      },
    );
  }
}
