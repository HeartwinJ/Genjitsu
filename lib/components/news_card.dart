import 'package:flutter/material.dart';
import 'package:genjitsu/pages/view_news_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.green,
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
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Heartwin Haveluck'),
                          Text(
                            '12 hrs ago',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi, et malesuada phasellus nibh urna imperdiet iaculis sed. Vitae, pellentesque vestibulum, blandit interdum vulputate placerat ultricies. Volutpat.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.thumb_up_outlined),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.thumb_down_outlined),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.flag_outlined),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        print('News Card Clicked!');
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const ViewNewsPage())));
      },
    );
  }
}
