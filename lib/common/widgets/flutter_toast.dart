import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
    {required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.sp);
}

void handleFirebaseAuthError(FirebaseAuthException e) {
  final errorMessages = {
    "invalid-email": "The email address is improperly formatted.",
    "user-disabled": "The user account has been disabled.",
    "user-not-found": "There is no user record corresponding to this email.",
    "wrong-password": "Incorrect password provided.",
    "email-already-in-use": "The email address is already registered.",
    "weak-password": "The password must be at least 6 characters long.",
    "missing-email": "No email was provided.",
    "missing-password": "No password was provided.",
    "invalid-credential": "The provided credential (e.g., token) is incorrect or expired.",
    "invalid-verification-code": "Incorrect OTP or verification code entered.",
    "invalid-verification-id": "The verification ID is invalid or expired.",
    "missing-verification-code": "No OTP or verification code provided.",
    "too-many-requests": "Too many failed attempts; access temporarily disabled.",
    "operation-not-allowed": "This sign-in method is not enabled in Firebase settings.",
    "requires-recent-login": "Sensitive operation (e.g., password change) requires recent login.",
    "provider-already-linked": "The account is already linked to another provider.",
    "credential-already-in-use": "The credential (e.g., Google/Facebook) is already linked to another user.",
    "session-cookie-expired": "The session cookie has expired.",
    "session-cookie-revoked": "The session cookie was revoked by the server.",
  };

  // Get error message from map, or fallback to a default message
  String message = errorMessages[e.code] ?? "Auth unknown error!";

  // Show the toast notification
  toastInfo(msg: message);
}
