import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/contests/contest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<String> category = [
    'beauty',
    'skincare',
    'clothing',
    'home accessories',
    'food',
    'electronics',
  ];

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
                    SizedBox(
                      width: 28.w,
                      child: Icon(Icons.settings_outlined, size: 26.w),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ),
              SizedBox(height: 50.w),
              Text(
                'shop on CareTracker and get\ndiscounts on every product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: CustomTheme.t1,
                ),
              ),
              SizedBox(height: 18.w),
              const DoubleDots(),
              SizedBox(height: 36.w),
              Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                children: [
                  for (int i = 0; i < category.length; i++)
                    Container(
                      height: 107.w,
                      width: 172.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5.w,
                          color: CustomTheme.grey,
                        ),
                        borderRadius: BorderRadius.circular(14.w),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 32.w,
                            width: 32.w,
                            child: Image.asset('assets/${category[i]}.png'),
                          ),
                          SizedBox(height: 4.w),
                          Text(
                            category[i],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomTheme.t1,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                ],
              )
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
