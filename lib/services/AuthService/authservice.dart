import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:worktrolly_flutter/environment/environment.dart';
import 'package:worktrolly_flutter/services/ApplicationService/applicationService.dart';
import 'package:worktrolly_flutter/services/NavigatorService/NavigatorService.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthService {
  User? user;

  getAuthState(BuildContext ctx) {
    print("Getting auth state");
    print(ctx);
    auth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
          navigatorService.stopApplication(ctx);
        } else {
          print('User is signed in!');
          user = FirebaseAuth.instance.currentUser;
          navigatorService.loadApplication(ctx);
        }
      },
      onError: (err) {
        print(err);
      },
    );
  }

  registerWithEmail() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "vivek.3071997@gmail.com", password: "Vivek3797@");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithGogleWeb() async {
    print("Signing with google...");
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    await signInWithGoogle();
    print("Sign in pop up");
  }

  Future<UserCredential> signInWithGoogle() async {
    print(device);
    if (getDevice() == Device.web) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    } else {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  signOut() async {
    print("Signing out");
    await FirebaseAuth.instance.signOut();
  }
}

AuthService authService = new AuthService();
