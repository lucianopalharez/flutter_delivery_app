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
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // se registrar
  Future<UserCredential> signUpUser(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
    
      return userCredential;
    } 

    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

}