import 'package:flutter/material.dart';
import 'package:genjitsu/components/news_card.dart';
import 'package:genjitsu/models/news_post.dart';
import 'package:genjitsu/services/store_service.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoreService().getNewsList(),
      builder: (context, AsyncSnapshot<List<NewsPost>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.flutter_dash,
                    size: 64,
                  ),
                  SizedBox(height: 10),
                  Text('Uh oh! No Posts yet!'),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              cacheExtent: snapshot.data!.length * 200,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, int index) => NewsCard(
                snapshot.data![index],
              ),
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: Color(0xFFE26B6B)),
              SizedBox(height: 20),
              Text('Loading...'),
            ],
          ),
        );
      },
    );
  }
}
