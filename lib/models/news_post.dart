import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPost {
  final Timestamp? timestamp;
  final String createdBy;
  final String newsContent;
  final bool isFake;

  NewsPost({
    this.timestamp,
    required this.createdBy,
    required this.newsContent,
    required this.isFake,
  });
}
