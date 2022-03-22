import 'package:flutter/material.dart';
import 'package:genjitsu/components/news_card.dart';

class NewsFeed extends StatelessWidget {
  NewsFeed({Key? key}) : super(key: key);

  final List _newsList = [
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _newsList.length,
        itemBuilder: (_, int index) => const NewsCard(),
      ),
    );
  }
}
