import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController(this.context);

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          // let validate email
        }
        if (password.isEmpty) {
          // let validate password
        }

        // call auth firebase
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            //
          }

          // email not yet verified
          if (!credential.user!.emailVerified) {
            //
          }

          var user = credential.user;
          if (user != null) {
            // we got user from firebase
          } else {
            // we have error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
