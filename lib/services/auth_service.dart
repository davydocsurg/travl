import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travl/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> registerUser(UserModel user, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    await _firebaseAuth.currentUser!
        .updateDisplayName('${user.firstName} ${user.lastName}');
    await _firestore.collection('users').doc(credential.user!.uid).set({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'createdAt': DateTime.now(),
    });

    return credential;
  }
}
