import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PickPackForiOSFirebaseUser {
  PickPackForiOSFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PickPackForiOSFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PickPackForiOSFirebaseUser> pickPackForiOSFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PickPackForiOSFirebaseUser>(
      (user) {
        currentUser = PickPackForiOSFirebaseUser(user);
        return currentUser!;
      },
    );
