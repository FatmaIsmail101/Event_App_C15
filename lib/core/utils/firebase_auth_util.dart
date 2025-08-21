import 'dart:developer';

import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/utils/services/snack_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  static final GoogleSignIn _googleSignIn=GoogleSignIn.instance;

  static Future<UserCredential?> signInWithGoogle() async {
try{
  await _googleSignIn.initialize(
serverClientId: dotenv.env['SERVER_CLIENT_ID']
  );
  final GoogleSignInAccount result= await _googleSignIn.authenticate();
  final googleAuth=result.authentication;
  final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
  return await FirebaseAuth.instance.signInWithCredential(credential);

}
catch(e){
  print("Google sign-in error : $e");
  return null;
}
  }

 static Future <void>loginWithGoogle(BuildContext context)async{
    try{
      await signInWithGoogle();
      SnackBarServices.showSucessMessage("Login in Successfully");
      Navigator.pushNamed(context, PageRoutesName.layout);
    }
        catch(e){
      SnackBarServices.showWarningMessage(msg: e.toString());
        }
  }
}
