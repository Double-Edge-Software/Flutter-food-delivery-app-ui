import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth changed user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // Sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (err){
      print(err.toString());
      return null;
    }
  }

  //Sign in with email and password

  //register with email and password

  Future registerWithEmailAndPassword(String email,String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user  = result.user;
      return _userFromFirebaseUser(user);
    } catch (err){
      print(err.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(err){
      print(err.toString());
      return null;
    }
  }
}