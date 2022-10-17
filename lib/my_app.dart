import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/repositories/auth_repository.dart';
import 'package:care_tracker/shared/error_screen.dart';
import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/wrapper.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
      child: BlocProvider<AppBloc>(
        create: (context) =>
            AppBloc(authRepository: context.read<AuthRepository>())
              ..add(AppStarted()),
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.getTheme(context),
              home: const Wrapper(),
              builder: (context, child) {
                int width = MediaQuery.of(context).size.width.toInt();
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaleFactor: width / 414),
                  child: child ?? const SomethingWentWrong(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
