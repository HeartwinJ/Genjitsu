import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userStream {
    return _auth.authStateChanges();
  }

  String get curUid {
    return _auth.currentUser!.uid;
  }

  String? get curEmail {
    return _auth.currentUser!.email;
  }

  String? get curName {
    return _auth.currentUser!.displayName;
  }

  String? get curPhotoURL {
    return _auth.currentUser!.photoURL;
  }

  signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User? user;
      await _auth.signInWithCredential(credential).then((authResult) => {user = authResult.user!}).catchError((error) => print(error));
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  signOut() {
    _auth.signOut();
  }
}
