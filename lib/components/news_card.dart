import 'package:flutter/material.dart';
import 'package:genjitsu/models/news_post.dart';
import 'package:genjitsu/pages/view_news_page.dart';
import 'package:genjitsu/services/store_service.dart';

class NewsCard extends StatelessWidget {
  final NewsPost _newsPost;
  const NewsCard(this._newsPost, {Key? key}) : super(key: key);

  String getReadableTimestamp() {
    Duration diff = DateTime.now().difference(_newsPost.timestamp!.toDate());
    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} ${diff.inSeconds == 1 ? 'second' : 'seconds'} ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} ${diff.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} ${diff.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (diff.inDays < 31) {
      return '${diff.inDays} ${diff.inDays == 1 ? 'day' : 'days'} ago';
    } else {
      return 'A long time ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: StoreService().getUserData(_newsPost.createdBy),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            dynamic authorData = snapshot.data;
            return GestureDetector(
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Container(
                            color: _newsPost.isFake ? Colors.red : Colors.green,
                            height: 5.0,
                            width: 100.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundColor: Colors.grey[850],
                                foregroundImage: NetworkImage(authorData!['photoUrl']),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(authorData!['displayName']),
                                  Text(
                                    getReadableTimestamp(),
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0),
                          Text(
                            _newsPost.newsContent,
                            style: const TextStyle(fontSize: 18.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ViewNewsPage(
                          newsPost: _newsPost,
                          authorData: authorData,
                          readableTimestamp: getReadableTimestamp(),
                        )),
                  ),
                );
              },
            );
          }
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFFE26B6B)),
              ),
            ),
          );
        });
  }
}
