import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthUtil{
  static Future <bool>createUserWithEmailandpass({
    required String email,
    required String password,})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     log ( credential.user!.uid);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Future.value(false);
      }
    } catch (e) {
      print(e);
    }
    return Future.value(false);

  }
  static Future <bool>signInWithEmailandPassword({

    required String password, required String email,})async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Future.value(false);
    } catch (e) {
      print(e);
    }
    return Future.value(false);
  }
}
