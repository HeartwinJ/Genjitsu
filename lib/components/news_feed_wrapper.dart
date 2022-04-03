import 'package:flutter/material.dart';
import 'package:genjitsu/pages/news_feed.dart';
import 'package:genjitsu/services/auth_service.dart';

class NewsFeedWrapper extends StatelessWidget {
  const NewsFeedWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Container(),
                      onPressed: () {},
                    ),
                    const Text(
                      '現実',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8.0,
                      ),
                    ),
                    GestureDetector(
                      child: Column(children: const [
                        Icon(Icons.login),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Login'),
                      ]),
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: NewsFeed(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
