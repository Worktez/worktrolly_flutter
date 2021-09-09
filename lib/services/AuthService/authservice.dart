import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:worktrolly_flutter/environment/environment.dart';
import 'package:worktrolly_flutter/interface/userInterface.dart';
import 'package:worktrolly_flutter/services/ApplicationService/applicationService.dart';
import 'package:worktrolly_flutter/services/NavigatorService/NavigatorService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:worktrolly_flutter/services/ThemeService/ThemeService.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseFunctions functions = FirebaseFunctions.instance;

class AuthService {
  getAuthState(BuildContext ctx) {
    auth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
          navigatorService.stopApplication(ctx);
        } else {
          print('User is signed in!');
          user = auth.currentUser;
          userInterface.setUser(user);
          navigatorService.loadApplication(ctx);
        }
      },
      onError: (err) {
        print(err);
      },
    );
  }

  Future<void> createUser() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('users');
    final results = await callable({
      'mode': "create",
      'uid': userInterface.uid,
      'photoURL': userInterface.photoURL,
      'displayName': userInterface.displayName,
      'email': userInterface.email,
      'phoneNumber': userInterface.phoneNumber,
      'providerId': userInterface.providerId,
    });
    String data = results.data;
    print(data);
    loading = false;
  }

  Future<void> getUserAppSettings() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('users');
    final results = await callable({
      'mode': "getUserAppSettings",
      'Uid': userInterface.uid,
    });
    Map<String, dynamic> result = new Map<String, dynamic>.from(results.data);
    userInterface.setUserAppSetting(result);
    loading = false;
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
    loading = true;
    print("Signing with google...");
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    signInWithGoogle().then((value) {
      if (value.user != null) {
        userInterface.setUser(value.user);
        createUser();
      }
    });
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
