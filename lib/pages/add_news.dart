import 'package:flutter/material.dart';

class AddNews extends StatelessWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey[900],
                filled: true,
              ),
              maxLines: 25,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text('Post'),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 18.0, letterSpacing: 2.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
