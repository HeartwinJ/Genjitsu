import 'package:flutter/material.dart';
import 'package:genjitsu/models/news_post.dart';

class ViewNewsPage extends StatelessWidget {
  final NewsPost newsPost;
  final dynamic authorData;
  final String readableTimestamp;
  const ViewNewsPage({Key? key, required this.newsPost, required this.authorData, required this.readableTimestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    const Text(
                      '現実',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Container(
                                  color: newsPost.isFake ? Colors.red : Colors.green,
                                  height: 5.0,
                                  width: 100.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.grey[850],
                                      foregroundImage: NetworkImage(authorData['photoUrl']),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(authorData['displayName']),
                                        Text(
                                          readableTimestamp,
                                          style: TextStyle(color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32.0),
                                Text(
                                  newsPost.newsContent,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
