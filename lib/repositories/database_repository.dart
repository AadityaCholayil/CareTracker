import 'dart:io';
import 'package:care_tracker/models/contest.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:care_tracker/models/user.dart';
import 'package:care_tracker/shared/error_screen.dart';

class DatabaseRepository {
  final String uid;

  DatabaseRepository({required this.uid});

  final FirebaseFirestore db = FirebaseFirestore.instance;

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  // Users Collection Reference
  // Reference allows for easy from and to operations
  CollectionReference<UserData> get usersRef =>
      db.collection('users').withConverter<UserData>(
            fromFirestore: (snapshot, _) =>
                UserData.fromJson(snapshot.data()!, snapshot.id),
            toFirestore: (user, _) => user.toJson(),
          );

  // User Stream
  Stream<List<UserData>> getUserStream() {
    Stream<List<UserData>> res = usersRef
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
    return res;
  }

  // Get UserData from DB
  Future<UserData> get completeUserData async {
    try {
      UserData userDataNew = await usersRef
          .doc(uid)
          .get()
          .then((value) => value.data() ?? UserData.empty);
      return userDataNew;
    } on Exception catch (_) {
      throw const SomethingWentWrong();
    }
  }

  // Update User in DB
  Future<void> updateUser(UserData userData) async {
    await usersRef.doc(uid).set(userData);
  }

  Future<String?> uploadFile(File _image) async {
    try {
      await storage.ref('UserProfiles/$uid/profile_pic.png').putFile(_image);
      var result = await storage
          .ref('UserProfiles/$uid/profile_pic.png')
          .getDownloadURL();
      print('profileUrl: $result');
      return result;
    } on Exception catch (e) {
      print('Failed - $e');
      return null;
    }
  }

  CollectionReference<Contest> get contestsRef =>
      db.collection('contests').withConverter<Contest>(
            fromFirestore: (snapshot, _) =>
                Contest.fromMap(snapshot.data()!),
            toFirestore: (contest, _) => contest.toMap(),
          );

  Future<Contest> getContest(String contestId) async {
    try {
      Contest contest = await contestsRef
          .where('contestId', isEqualTo: contestId)
          .get()
          .then((value) => value.docs.first.data());
      return contest;
    } on Exception catch (_) {
      throw const SomethingWentWrong();
    }
  }
}
