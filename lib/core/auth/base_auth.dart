import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);

  Future<String> createUserWithEmailAndPassword(String email, String password);

  Future<String> signInWithGoogle();

  Future<String> currentUser();

  Future<void> signOut();
}

class BaseAuthImpl implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    final User? user =
        (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user!.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    final User? user =
        (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user!.uid;
  }

  @override
  Future<String> currentUser() async {
    final User? user = _firebaseAuth.currentUser;
    return user!.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<String> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount!.authentication;
    final AuthCredential credential =
        GoogleAuthProvider.credential(idToken: gSA.idToken, accessToken: gSA.accessToken);
    final User? user = (await _firebaseAuth.signInWithCredential(credential)).user;
    print('Выполнен вход как ${user!.displayName}');

    return user.uid;
  }
}
