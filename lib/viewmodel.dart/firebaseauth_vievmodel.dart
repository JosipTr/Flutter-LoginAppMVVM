import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial/resources/models/firebaseauth_model.dart';

class FirebaseAuthViewModel {
  final FirebaseAuthModel _firebaseAuthModel = FirebaseAuthModel();

  Future signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthModel.signInWithEmailAndPassword(email, password);
  }

  Future signOut() async {
    await _firebaseAuthModel.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuthModel.authStateChanges();
  }

  Future createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthModel.createUserWithEmailAndPassword(email, password);
  }

  Future sendPasswordResetEmail(String email) async {
    await _firebaseAuthModel.sendPasswordResetEmail(email);
  }
}