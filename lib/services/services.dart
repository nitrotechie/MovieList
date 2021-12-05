import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/Screen/login.dart';

Future<User> googleSign() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();

  var _authentication = await _googleSignInAccount!.authentication;
  var _credential = GoogleAuthProvider.credential(
    idToken: _authentication.idToken,
    accessToken: _authentication.accessToken,
  );

  User? user = (await _auth.signInWithCredential(_credential)).user;
  return user!;
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}

class Services {
  static var url = "";
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      return null;
    }
  }

  static getImageUrl(String fileName) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(fileName);
      url = await ref.getDownloadURL();
      print(url);
    } catch (e) {
      return null;
    }
  }
}
