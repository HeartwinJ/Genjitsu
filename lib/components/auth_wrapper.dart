import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genjitsu/components/news_feed_wrapper.dart';
import 'package:genjitsu/pages/app_wrapper.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user != null) {
      return const AppWrapper();
    }
    return const NewsFeedWrapper();
  }
}
