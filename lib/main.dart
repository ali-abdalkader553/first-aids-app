// ignore_for_file: unused_import

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Add_Diseases.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Add_First_Aids.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Add_Number.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Add_explanation.dart';
import 'package:first_aids_app_pro1/auth/notification_helper.dart';
import 'package:first_aids_app_pro1/screens/Center_Official/Co_Home.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Add_Or_Information.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/OR_Add_Mission.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Or_Choose_Center.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Or_Home.dart';
import 'package:first_aids_app_pro1/screens/Team_Leader/Patient_info.dart';
import 'package:first_aids_app_pro1/screens/Team_Leader/TL_Home.dart';
import 'package:first_aids_app_pro1/screens/User/HomePage.dart';
import 'package:first_aids_app_pro1/screens/User/LoginPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await NotificationHelper.init();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String token = await messaging.getToken() ?? '';
  log(token, name: 'Token');
  log(token, name: 'Token');
  log(token, name: 'Token');
  log(token, name: 'Token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "addfirstaid": (context) => Add_First_Aids(),
        "addnumber": (context) => Add_Number(),
        "addexplanation": (context) => Add_Explanation(
              docid: 'widget.docid',
            ),
        "adddiseases": (context) => Add_Diseases(
              docid: 'widget.diseasesid',
            ),
        "choosecenter": (context) => Or_choose_center(),
        "addorminformation": (context) => AddOrInformation(),
        "okormissoninfo": (context) => OrAddMission(),
        "rejectormissoninfo": (context) => OrAddMission(),
        "patientinformation": (context) => patientinfo(),
      },
    );
  }
}
