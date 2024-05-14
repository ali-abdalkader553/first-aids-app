import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../screens/Center_Official/Co_Home.dart';
import '../screens/Operations_Room/Or_Home.dart';
import '../screens/Team_Leader/TL_Home.dart';
import '../screens/User/HomePage.dart';

enum UserType {
  user,
  operationRoom,
  centerOfficial,
  teamLeader,
  admin;

  static UserType fromString(String type) {
    switch (type) {
      case 'user':
        return UserType.user;
      case 'or':
        return UserType.operationRoom;
      case 'co':
        return UserType.centerOfficial;
      case 'tl':
        return UserType.teamLeader;
      case 'admin':
        return UserType.admin;

      default:
        return UserType.user;
    }
  }

  @override
  String toString() {
    switch (this) {
      case UserType.user:
        return 'user';
      case UserType.operationRoom:
        return 'or';
      case UserType.centerOfficial:
        return 'co';
      case UserType.teamLeader:
        return 'tl';
      case UserType.admin:
        return 'admin';
    }
  }
}

class AuthUser {
  final String id;
  final String email;
  final String notificationToken;
  final UserType type;

  static late AuthUser instance;

  AuthUser._(
    this.id,
    this.email,
    this.notificationToken,
    this.type,
  );

  Widget get mainScreen {
    switch (type) {
      case UserType.user:
        return HomePage();
      case UserType.operationRoom:
        return HomeOrRoom();
      case UserType.centerOfficial:
        return CoHomeScreen();
      case UserType.teamLeader:
        return TlHomescreen();
      case UserType.admin:
        return HomePage();
    }
  }

  bool get isAdmin {
    return type == UserType.admin;
  }

  factory AuthUser._update({
    required String id,
    required String email,
    required String notificationToken,
    required UserType type,
  }) {
    instance = AuthUser._(id, email, notificationToken, type);
    return AuthUser._(id, email, notificationToken, type);
  }
}

class AuthHelper {
  static Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = userCredential.user!;

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken() ?? '';

    var fireStoreUser = (await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get())
        .data();

    fireStoreUser ??= {};

    await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      'id': fireStoreUser['id'],
      'email': fireStoreUser['email'],
      'type': UserType.fromString(fireStoreUser['type']).toString(),
      'notificationToken': token,
    });

    return AuthUser._update(
        id: fireStoreUser['id'],
        email: fireStoreUser['email'],
        notificationToken: token,
        type: UserType.fromString(fireStoreUser['type']));
  }

  static Future<AuthUser> register({
    required String email,
    required String password,
  }) async {
    var userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = userCredential.user!;

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken() ?? '';

    await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      'id': user.uid,
      'email': email,
      'type': UserType.user.toString(),
      'notificationToken': token,
    });

    return AuthUser._update(
      id: user.uid,
      email: email,
      notificationToken: token,
      type: UserType.user,
    );
  }
}
