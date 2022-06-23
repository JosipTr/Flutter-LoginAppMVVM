import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}