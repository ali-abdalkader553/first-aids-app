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

class User {
  final String id;
  final String email;
  final String notificationToken;
  final UserType userType;

  static User? instance;

  User._(
    this.id,
    this.email,
    this.notificationToken,
    this.userType,
  );

  factory User._update({
    required String id,
    required String email,
    required String notificationToken,
    required UserType userType,
  }) {
    instance = User._(id, email, notificationToken, userType);
    return User._(id, email, notificationToken, userType);
  }
}

class AuthHelper {
  static Future<User> signIn({
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

    return User._update(
      id: fireStoreUser['id'],
      email: fireStoreUser['email'],
      notificationToken: fireStoreUser['notificationToken'],
      userType: UserType.fromString(fireStoreUser['userType']),
    );
  }

  static Future<User> reigister({
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

    return User._update(
      id: user.uid,
      email: email,
      notificationToken: token,
      userType: UserType.user,
    );
  }
}
