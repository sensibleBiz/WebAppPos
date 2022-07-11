import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WebAppPOSFirebaseUser {
  WebAppPOSFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

WebAppPOSFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WebAppPOSFirebaseUser> webAppPOSFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<WebAppPOSFirebaseUser>(
        (user) => currentUser = WebAppPOSFirebaseUser(user));
