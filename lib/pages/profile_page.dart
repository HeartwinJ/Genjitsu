import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 120.0,
                backgroundColor: Colors.grey[850],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Heartwin Haveluck',
                style: TextStyle(fontSize: 28.0),
              ),
              const Text('heartwinhaveluck@gmail.com'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text('Logout'),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
              side: MaterialStateProperty.all<BorderSide>(const BorderSide(
                width: 1.0,
                color: Colors.red,
              )),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 18.0, letterSpacing: 2.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
