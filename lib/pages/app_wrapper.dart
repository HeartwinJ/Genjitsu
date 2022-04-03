import 'package:flutter/material.dart';
import 'package:genjitsu/models/nav_detail.dart';
import 'package:genjitsu/pages/add_news.dart';
import 'package:genjitsu/pages/news_feed.dart';
import 'package:genjitsu/pages/profile_page.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _currentindex = 0;
  late List<NavDetail> _children;

  _AppWrapperState() {
    _children = <NavDetail>[
      NavDetail(
        page: const NewsFeed(),
      ),
      NavDetail(
        page: AddNews(navController: _onNavTabTapped),
      ),
      NavDetail(
        page: ProfilePage(),
      ),
    ];
  }

  _onNavTabTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '現実',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8.0,
                  ),
                ),
              ),
              Expanded(
                child: _children.elementAt(_currentindex).page,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavTabTapped,
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
