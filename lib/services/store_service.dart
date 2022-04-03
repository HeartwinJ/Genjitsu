import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot?> getUserDocument(String uid) async {
    DocumentSnapshot? doc;
    try {
      await _users.doc(uid).get().then((result) => doc = result);
    } catch (error) {
      print(error.toString());
    }
    return doc;
  }
}
