import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/contests/contest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
          HomeCubit(user: context.read<AppBloc>().user)..getData(),
      child: Builder(
        builder: (context) {
          return Container(
            color: CustomTheme.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 28.w,
                        child: Icon(Icons.notes_rounded, size: 26.w),
                      ),
                      const Spacer(),
                      Text(
                        'CareTracker',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: CustomTheme.t1,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 28.w,
                        child: Icon(Icons.settings_outlined, size: 26.w),
                      ),
                      SizedBox(width: 4.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                _buildGreeting(),
                SizedBox(height: 16.w),
                const StepCounterView(),
                SizedBox(height: 20.w),
                _buildWalletCard(),
                SizedBox(height: 20.w),
                Text(
                  'earn by walking',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: CustomTheme.t1,
                  ),
                ),
                SizedBox(height: 11.w),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContestList()));
                  },
                  child: Container(
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: CustomTheme.accent,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 58.w, vertical: 18.w),
                    child: Text(
                      'join now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.t3,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWalletCard() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Center(
          child: Container(
            height: 85.w,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5.w,
                color: CustomTheme.grey,
              ),
              borderRadius: BorderRadius.circular(14.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.w),
                      child: Text(
                        '₹',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: CustomTheme.t1,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${state.user.walletBalance}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.t1,
                        height: 0.8,
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],
                ),
                Text(
                  'wallet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: CustomTheme.t2,
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGreeting() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 17.w, right: 4.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'good morning',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: CustomTheme.t1,
                    ),
                  ),
                  Text(
                    state.user.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: CustomTheme.t1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const DoubleDots(),
            ],
          ),
        );
      },
    );
  }
}

class DoubleDots extends StatelessWidget {
  const DoubleDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.w,
      child: Column(
        children: [
          Container(
            height: 7.w,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.grey,
            ),
          ),
          SizedBox(height: 16.w),
          Container(
            height: 7.w,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class StepCounterView extends StatelessWidget {
  const StepCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Center(
        child: Container(
          height: 285.w,
          width: 285.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.1.w,
              color: const Color(0xFFF6F6F6),
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            height: 241.w,
            width: 241.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.2.w,
                color: const Color(0xFFF2F2F2),
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 200.w,
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomTheme.grey,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 145.w,
                width: 145.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CustomTheme.t1,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 18.w),
                    Text(
                      '${state.user.steps}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: CustomTheme.t3,
                        height: 0.7,
                      ),
                    ),
                    Text(
                      'steps',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.t2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
