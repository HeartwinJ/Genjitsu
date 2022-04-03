import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:genjitsu/common/custom_theme.dart';
import 'package:genjitsu/components/auth_wrapper.dart';
import 'package:genjitsu/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genjitsu',
      theme: customTheme,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider.value(
              value: AuthService().userStream,
              initialData: null,
              child: const AuthWrapper(),
            );
          }
          return const Scaffold(
            body: Text('Loading...'),
          );
        },
      ),
    );
  }
}
