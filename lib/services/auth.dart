import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthClass{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userRef = FirebaseDatabase.instance.reference().child("Users");
  Future<String> registerWithEmailAndPassword(String fname, String lname, String email, String password) async {
    Map<String, String> userInfo = {
      "first_name": fname,
      "last_name": lname,
      "email": email
    };
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      String _uid = result.user.uid;
      await _userRef.child(_uid).set(userInfo);
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Registration Failed";
    }
  }
  Future<String> signInwithEmail(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print(userCredential.user.uid);
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

}