
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/HomePage.dart';
import '../screens/LoginPage.dart';


class Auth extends StatelessWidget {
  const Auth({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context , snapshot){
          if
          (snapshot.hasData){
            return HomePage();
          }
          else {
            return LoginPage();
          }
        }),
      ),
    );
  }
}
