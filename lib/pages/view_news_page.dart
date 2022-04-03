import 'package:flutter/material.dart';

class ViewNewsPage extends StatelessWidget {
  const ViewNewsPage({Key? key}) : super(key: key);

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
                      icon: const Icon(Icons.flag_outlined),
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
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices in est amet, ut nec convallis amet amet, non. Consectetur malesuada posuere a aliquam, tincidunt. Quis scelerisque enim elementum ipsum est. Interdum ipsum at malesuada vulputate in sit in. Cursus massa viverra sit integer et. Scelerisque id ut etiam vivamus ut dictum. Placerat habitasse non sit dignissim adipiscing risus tellus et. Augue cursus id tellus eu donec lorem justo. Amet nisi, nec dignissim nulla. Nunc tortor, iaculis praesent condimentum ut consectetur elit sed urna. A ultrices ut fames non malesuada sit. Turpis habitasse et consequat sagittis neque, et eget ac posuere. A sapien tortor consectetur gravida. Mus pulvinar urna blandit elementum suspendisse nec sed etiam dignissim. Dignissim quis in accumsan mattis mauris, aliquet sed et. Leo id urna, donec sit non facilisi. Sed gravida volutpat fames cras enim aenean mi, posuere lacus. Fermentum velit non non, integer risus vulputate tempor a ac. Ultrices sit netus volutpat purus mi risus sed etiam. Semper sem in mauris, commodo. Congue consectetur pellentesque.',
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
                                  ],
                                )
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
