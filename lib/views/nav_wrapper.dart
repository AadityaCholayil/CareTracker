import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/home/home_page.dart';
import 'package:care_tracker/views/shop/shop_page.dart';
import 'package:care_tracker/views/trips/trips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavWrapper extends StatefulWidget {
  const NavWrapper({super.key});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  int pageIndex = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          onPageChanged: (int index) {
            if ((pageIndex - index).abs() == 1) {
              setState(() {
                pageIndex = index;
              });
            }
          },
          children: const <Widget>[
            HomePage(),
            ShopPage(),
            TripsPage(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80.w,
          decoration: BoxDecoration(
            color: CustomTheme.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 1),
                color: Colors.black.withOpacity(0.07),
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavButton(text: 'home', index: 0),
                  _buildNavButton(text: 'shop', index: 1),
                  _buildNavButton(text: 'trips', index: 2),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.w, left: 47.w, right: 43.w),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 7.w,
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 600),
                    // curve: Curves.linearToEaseOut,
                    curve: Curves.bounceOut,
                    alignment: pageIndex == 0
                        ? Alignment.centerLeft
                        : pageIndex == 1
                            ? Alignment.center
                            : Alignment.centerRight,
                    child: Container(
                      height: 7.w,
                      width: 7.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomTheme.accent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required String text,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      },
      child: Container(
        color: CustomTheme.white,
        padding: EdgeInsets.only(left: 10.w, right: 15.w, bottom: 10.w),
        height: 75.w,
        child: Row(
          children: [
            SizedBox(
              height: 24.w,
              width: 24.w,
              child: Image.asset(
                  'assets/$text${index == pageIndex ? '-filled' : ''}.png'),
            ),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CustomTheme.t1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
