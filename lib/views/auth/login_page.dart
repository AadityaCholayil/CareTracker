import 'package:care_tracker/views/auth/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/shared/error_screen.dart';
import 'package:care_tracker/shared/loading.dart';
import 'package:care_tracker/shared/shared_widgets.dart';
import 'package:care_tracker/theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  String stateMessage = '';
  bool showPassword = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) async {
        if (state is LoginPageState) {
          if (state == LoginPageState.loading) {
            showLoadingSnackBar(context);
          } else {
            showErrorSnackBar(context, state.message);
          }
        }
        if (state is Authenticated) {
          stateMessage = 'Success!';
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: CustomTheme.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomBackButton(),
                      const Spacer(flex: 2),
                      Text(
                        'welcome to,',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w300,
                          color: CustomTheme.t2,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        'CareTracker',
                        style: TextStyle(
                          height: 1.25,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.accent,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          'login to continue',
                          style: TextStyle(
                            height: 1.25.w,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: CustomTheme.t1,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      TextFormField(
                        decoration: customInputDecoration(labelText: 'email'),
                        style: formTextStyle(),
                        onSaved: (value) {
                          email = value ?? '';
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!validateEmail(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.w),
                      Stack(
                        children: [
                          TextFormField(
                            decoration:
                                customInputDecoration(labelText: 'password'),
                            style: formTextStyle(),
                            obscureText: !showPassword,
                            onSaved: (value) {
                              password = value ?? '';
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10.w),
                            height: 56.w,
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 28.w),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.w),
                      CustomElevatedButton(
                        text: 'login',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState?.save();
                          showErrorSnackBar(context, stateMessage);
                          BlocProvider.of<AppBloc>(context)
                              .add(LoginUser(email: email, password: password));
                        },
                      ),
                      const Spacer(flex: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account?",
                            style:
                                TextStyle(fontSize: 14, color: CustomTheme.t2),
                          ),
                          TextButton(
                            child: Text(
                              "signup!",
                              style: TextStyle(
                                  fontSize: 14, color: CustomTheme.t1),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailsPage()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool validateEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
