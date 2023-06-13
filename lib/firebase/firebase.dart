import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/screen/homepage.dart';
import 'package:get/get.dart';

sigUpbutton(String email, String password, String username, context) async {
  print('signupbutton firebase starting');
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LandingPage(username: username, email: email);
      },
    ));
    Get.snackbar(
      "Sigup", // Title of the snackbar
      "SigUp SuccessFully", // Message of the snackbar
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      duration: const Duration(seconds: 3), // Duration to show the snackbar
      backgroundColor: Colors.red, // Background color of the snackbar
      colorText: Colors.white, // Text color of the snackbar
      borderRadius: 10.0, // Border radius of the snackbar
    );
    print("Successsssssss");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar(
        "Error", // Title of the snackbar
        "The account already exists for that email.", // Message of the snackbar
        snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        duration: const Duration(seconds: 3), // Duration to show the snackbar
        backgroundColor: Colors.red, // Background color of the snackbar
        colorText: Colors.white, // Text color of the snackbar
        borderRadius: 10.0, // Border radius of the snackbar
      );
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

loginbutton(String email, String password, context, username) async {
  print('Loginbutton firebase starting');
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LandingPage(username: username, email: email);
      },
    ));
    print('Login Successfully');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar(
        "Email", // Title of the snackbar
        "No user found for that email.", // Message of the snackbar
        snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        duration: const Duration(seconds: 3), // Duration to show the snackbar
        backgroundColor: Colors.red, // Background color of the snackbar
        colorText: Colors.white, // Text color of the snackbar
        borderRadius: 10.0, // Border radius of the snackbar
      );
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      Get.snackbar(
        "Password", // Title of the snackbar
        "Wrong password provided for that user.", // Message of the snackbar
        snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        duration: const Duration(seconds: 3), // Duration to show the snackbar
        backgroundColor: Colors.red, // Background color of the snackbar
        colorText: Colors.white, // Text color of the snackbar
        borderRadius: 10.0, // Border radius of the snackbar
      );

      print('Wrong password provided for that user.');
    }
  }
}
