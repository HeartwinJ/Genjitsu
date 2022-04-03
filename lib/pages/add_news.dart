import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genjitsu/models/news_post.dart';
import 'package:genjitsu/services/auth_service.dart';
import 'package:genjitsu/services/store_service.dart';
import 'package:http/http.dart' as http;

class AddNews extends StatefulWidget {
  final dynamic navController;

  const AddNews({Key? key, this.navController}) : super(key: key);

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final TextEditingController textController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true,
                ),
                maxLines: 20,
              ),
            ),
            const SizedBox(height: 20.0),
            isLoading
                ? Card(
                    color: Colors.grey.shade800,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16,
                      ),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      if (textController.text.isEmpty) return;
                      setState(() {
                        isLoading = true;
                      });
                      http
                          .post(
                        Uri.parse('https://genjitsu-prediction-api.herokuapp.com/api/predict'),
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode({
                          'model': 'DT',
                          'newsBody': textController.text,
                        }),
                      )
                          .then((value) {
                        StoreService().createNews(NewsPost(
                          timestamp: Timestamp.now(),
                          createdBy: AuthService().curUid,
                          newsContent: textController.text,
                          isFake: jsonDecode(value.body)['prediction'] == 'fake',
                        ));
                        textController.clear();
                        setState(() {
                          isLoading = false;
                        });
                        widget.navController(0);
                      }).catchError((error) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
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
