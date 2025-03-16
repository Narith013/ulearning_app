import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'login') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty || emailAddress == '') {
          toastInfo(msg: 'you need to fill email!');
          return;
        } else {
          print('email is ${emailAddress}');
        }
        if (password.isEmpty || password == '') {
          // let validate password
          toastInfo(msg: 'you need to fill password!');
          return;
        }

        // call auth firebase
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "user don't exits!");
            return;
          }

          // email not yet verified
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'you need to verify your account!');
            return;
          }

          var user = credential.user;
          if (user != null) {
            Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');
            // we got user from firebase
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.APPLICATION, (route) => false);
          } else {
            // we have error getting user from firebase
            toastInfo(msg: 'currently you are not a user of this app!');
            return;
          }
        } on FirebaseAuthException catch (e) {
          handleFirebaseAuthError(e);
          return;
        }
      }
    } catch (e) {
      toastInfo(msg: 'Unknown error!');
    }
  }
}
