import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

enum UserType {
  user,
  operationRoom,
  centerOfficial,
  teamLeader,
  admin;

  static UserType fromString(String userType) {
    switch (userType) {
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
  final UserType userType;

  static AuthUser? instance;

  AuthUser._(
    this.id,
    this.email,
    this.notificationToken,
    this.userType,
  );

  factory AuthUser._update({
    required String id,
    required String email,
    required String notificationToken,
    required UserType userType,
  }) {
    instance = AuthUser._(id, email, notificationToken, userType);
    return AuthUser._(id, email, notificationToken, userType);
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

    await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      'id': user.uid,
      'email': email,
      'userType': UserType.user.toString(),
      'notificationToken': token,
    });

    var fireStoreUser = (await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get())
        .data();

    fireStoreUser ??= {};

    return AuthUser._update(
      id: fireStoreUser['id'],
      email: fireStoreUser['email'],
      notificationToken: fireStoreUser['notificationToken'],
      userType: UserType.fromString(fireStoreUser['userType']),
    );
  }

  static Future<AuthUser> reigister({
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
      'userType': UserType.user.toString(),
      'notificationToken': token,
    });

    return AuthUser._update(
      id: user.uid,
      email: email,
      notificationToken: token,
      userType: UserType.user,
    );
  }
}
