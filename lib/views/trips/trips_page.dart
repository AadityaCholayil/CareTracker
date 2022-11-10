import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/contests/contest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
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
                    GestureDetector(
                      onTap: () {
                        context.read<AppBloc>().add(LogoutUser());
                      },
                      child: SizedBox(
                        width: 28.w,
                        child: Icon(Icons.settings_outlined, size: 26.w),
                      ),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ),
              SizedBox(height: 50.w),
              // Text(
              //   'shop on CareTracker and get\ndiscounts on every product',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w500,
              //     color: CustomTheme.t1,
              //   ),
              // ),
              // SizedBox(height: 18.w),
              // const DoubleDots(),
              SizedBox(height: 36.w),
              SizedBox(
                height: 450.w,
                child: Center(
                  child: Text(
                    'coming soon',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: CustomTheme.t1,
                    ),
                  ),
                ),
              ),
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
      width: 30.w,
      child: Row(
        children: [
          Container(
            height: 7.w,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.grey,
            ),
          ),
          SizedBox(width: 16.w),
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
