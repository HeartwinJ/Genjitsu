import 'package:flutter/material.dart';
import 'package:genjitsu/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

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
                foregroundImage: NetworkImage(_auth.curPhotoURL!),
              ),
              const SizedBox(height: 20.0),
              Text(
                _auth.curName!,
                style: const TextStyle(fontSize: 28.0),
              ),
              Text(_auth.curEmail!),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextButton(
            onPressed: () {
              _auth.signOut();
            },
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
