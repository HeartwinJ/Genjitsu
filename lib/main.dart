import 'package:flutter/material.dart';
import 'package:genjitsu/common/custom_theme.dart';
import 'package:genjitsu/pages/app_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genjitsu',
      theme: customTheme,
      home: const AppWrapper(),
    );
  }
}
