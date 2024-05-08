import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_helper.dart';

class FireUser {
  final String id;
  final String email;
  final String notificationToken;
  final UserType userType;

  FireUser({
    required this.id,
    required this.email,
    required this.notificationToken,
    required this.userType,
  });

  factory FireUser.fromMap(Map<String, dynamic> map) {
    return FireUser(
      id: map['id'],
      email: map['email'],
      notificationToken: map['notificationToken'],
      userType: map['userType'],
    );
  }
}

class FirestoreHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<FireUser>> getFireUsers() async {
    List<FireUser> users = [];

    var fireList = (await firestore.collection('user').get()).docs;

    for (var element in fireList) {
      users.add(FireUser.fromMap(element.data()));
    }

    return users;
  }
}
