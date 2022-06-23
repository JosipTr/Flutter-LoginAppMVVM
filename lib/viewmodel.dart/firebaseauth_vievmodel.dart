import 'package:tutorial/resources/models/firebaseauth_model.dart';

class FirebaseAuthViewModel {
  final FirebaseAuthModel _firebaseAuthModel = FirebaseAuthModel();

  Future signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthModel.signInWithEmailAndPassword(email, password);
  }

  Future signOut() async {
    await _firebaseAuthModel.signOut();
  }
}