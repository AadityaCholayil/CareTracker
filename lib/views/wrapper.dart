import 'package:care_tracker/views/nav_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/shared/loading.dart';
import 'package:care_tracker/views/auth/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is Uninitialized) {
          return const LoadingPage();
        } else if (state is Unauthenticated || state is LoginPageState) {
          return const LoginPage();
        } else if (state is Authenticated) {
          return const NavWrapper();
        } else {
          return const LoadingPage();
        }
      },
    );
  }
}
