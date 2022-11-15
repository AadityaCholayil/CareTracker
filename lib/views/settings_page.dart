import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/contests/payment_dummy_page.dart';
import 'package:care_tracker/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(width: 4.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 28.w,
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
                      SizedBox(width: 4.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                _buildContestCard(context),
                _buildContestCard(context),
                _buildContestCard(context),
                _buildContestCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildContestCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22.w),
      margin: EdgeInsets.only(bottom: 32.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
          color: CustomTheme.grey,
        ),
        borderRadius: BorderRadius.circular(14.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.w),
          Text(
            'regular contest',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: CustomTheme.t1,
            ),
          ),
          SizedBox(height: 15.w),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 28.w,
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
                width: 28.w,
                alignment: Alignment.centerRight,
                child: const DoubleDots(),
              ),
              SizedBox(width: 22.w),
            ],
          ),
          SizedBox(height: 22.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.w),
                child: Text(
                  '₹',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: CustomTheme.t2,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '2',
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.w400,
                  color: CustomTheme.t1,
                  height: 1.1,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentDummyPage()));
                },
                child: Container(
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: CustomTheme.accent,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.w, vertical: 14.w),
                  child: Text(
                    'join now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomTheme.t3,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
            ],
          ),
          SizedBox(height: 12.w),
        ],
      ),
    );
  }
}
