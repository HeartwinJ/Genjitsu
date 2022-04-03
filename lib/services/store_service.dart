import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:genjitsu/models/news_post.dart';

class StoreService {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  final CollectionReference _news = FirebaseFirestore.instance.collection('news');

  createUser(User user) {
    try {
      _users.doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
      });
    } catch (error) {
      print(error.toString());
    }
  }

  Future getUserData(String uid) async {
    try {
      return _users.doc(uid).get();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<NewsPost>> getNewsList() async {
    List<NewsPost> newsList = [];
    try {
      await _news.orderBy('timestamp', descending: true).get().then((result) => newsList = result.docs
          .map(
            (e) => NewsPost(
              timestamp: e['timestamp'],
              createdBy: e['createdBy'],
              newsContent: e['newsContent'],
              isFake: e['isFake'],
            ),
          )
          .toList());
    } catch (error) {
      print(error.toString());
    }
    return newsList;
  }

  createNews(NewsPost post) async {
    try {
      await _news.add({
        'timestamp': post.timestamp,
        'createdBy': post.createdBy,
        'newsContent': post.newsContent,
        'isFake': post.isFake,
      });
    } catch (error) {
      print(error.toString());
    }
  }
}
