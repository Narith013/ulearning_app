import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/Register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/Register/bloc/register_events.dart';
import 'package:ulearning_app/pages/Register/bloc/register_states.dart';
import 'package:ulearning_app/pages/Register/register_controller.dart';

import '../../common/widgets/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.w,
                ),
                Center(
                    child: reusableText(
                        "Enter your details below and free sign up")),
                Container(
                  margin: EdgeInsets.only(top: 36.w),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('User name'),
                      buildTextField('Enter your user name', 'name', 'user',
                          (userName) {
                        context
                            .read<RegisterBloc>()
                            .add(UserNameEvent(userName));
                      }),
                      reusableText('Email'),
                      buildTextField(
                          'Enter your email address!', 'email', 'user',
                          (email) {
                        context.read<RegisterBloc>().add(EmailEvent(email));
                      }),
                      reusableText('Password'),
                      buildTextField('Enter your password', 'password', 'lock',
                          (password) {
                        context
                            .read<RegisterBloc>()
                            .add(PasswordEvent(password));
                      }),
                      reusableText('Re-enter Password'),
                      buildTextField(
                          'Enter your confirm password', 'password', 'lock',
                          (rePassword) {
                        context
                            .read<RegisterBloc>()
                            .add(RePasswordEvent(rePassword));
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: reusableText(
                      "By creating an account you have to agree with our term & condition."),
                ),
                buildLogInAndRegButton('Sign Up', 'login', () {
                  RegisterController(context: context).handleEmailRegister();
                })
              ],
            ),
          ),
        )),
      );
    });
  }
}
