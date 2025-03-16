import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sign_in_states.dart';
import 'package:ulearning_app/pages/sing_in/sign_in_controller.dart';

import '../../common/widgets/common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: buildAppBar("Sign In"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child: reusableText("Or use your email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          'Enter your email address!', 'email', 'user',
                          (email) {
                        context.read<SignInBloc>().add(EmailEvent(email));
                      }),
                      reusableText('Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField('Enter your password', 'password', 'lock',
                          (password) {
                        context.read<SignInBloc>().add(PasswordEvent(password));
                      }),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLogInAndRegButton('Log in', 'login', () {
                  SignInController(context: context).handleSignIn("login");
                }),
                buildLogInAndRegButton('Sign Up', 'register', () {
                  Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                })
              ],
            ),
          ),
        )),
      );
    });
  }
}
