import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContestDetails extends StatefulWidget {
  const ContestDetails({super.key});

  @override
  State<ContestDetails> createState() => _ContestDetailsState();
}

class _ContestDetailsState extends State<ContestDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: CustomTheme.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 26.w,
                          child: Icon(Icons.arrow_back_ios_rounded, size: 26.w),
                        ),
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
                      SizedBox(width: 28.w),
                    ],
                  ),
                ),
                SizedBox(height: 15.w),
                Text(
                  'regular contest',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: CustomTheme.t1,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 34.w,
                      alignment: Alignment.centerLeft,
                      child: const DoubleDots(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.w),
                                    child: Icon(
                                      Icons.person_outline_outlined,
                                      size: 20.w,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: CustomTheme.t1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'slots',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: CustomTheme.t2,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: CustomTheme.t1,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.w),
                                    child: Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: CustomTheme.t1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'time',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: CustomTheme.t2,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: CustomTheme.t1,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.w),
                                    child: Text(
                                      '%',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: CustomTheme.t1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'winnings',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: CustomTheme.t2,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 34.w,
                      alignment: Alignment.centerRight,
                      child: const DoubleDots(),
                    ),
                    // SizedBox(width: 22.w),
                  ],
                ),
                SizedBox(height: 45.w),
                Text(
                  'leaderboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CustomTheme.t1,
                  ),
                ),
                SizedBox(height: 15.w),
                Row(
                  children: [
                    Text(
                      'name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: CustomTheme.t2,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(width: 16.w),
                    Container(
                      alignment: Alignment.center,
                      width: 64.w,
                      child: Text(
                        'steps',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: CustomTheme.t2,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      alignment: Alignment.center,
                      width: 52.w,
                      child: Text(
                        'rank',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: CustomTheme.t2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.w),
                _buildProfile(),
                _buildProfile(),
                _buildProfile(),
                _buildProfile(),
                _buildProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.w),
      child: Row(
        children: [
          Container(
            height: 26.w,
            width: 26.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset('assets/edited.png'),
          ),
          SizedBox(width: 10.w),
          Text(
            'Aaditya Cholayil',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: CustomTheme.t1,
            ),
          ),
          const Spacer(),
          SizedBox(width: 16.w),
          Container(
            alignment: Alignment.center,
            width: 64.w,
            child: Text(
              '1,000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CustomTheme.t1,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            alignment: Alignment.center,
            width: 52.w,
            child: Text(
              '#1',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CustomTheme.t1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
