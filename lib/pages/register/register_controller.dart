import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/Register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: "Confirm password can not be empty");
      return;
    }

    if (rePassword != password) {
      toastInfo(msg: "Confirm password incorrect");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate your account. please check your email box and click on the link");
      }
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthError(e);
      return;
    }
  }
}
