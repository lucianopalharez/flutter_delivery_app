import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  // chama o firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // pega o usuario atual
  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  // entrar
  Future<UserCredential> signInUser(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    
      return userCredential;
    } 

    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sair

  // se registrar
}