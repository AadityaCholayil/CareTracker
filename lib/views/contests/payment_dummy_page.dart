import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/contests/contest_details.dart';
import 'package:flutter/material.dart';

class PaymentDummyPage extends StatefulWidget {
  const PaymentDummyPage({super.key});

  @override
  State<PaymentDummyPage> createState() => _PaymentDummyPageState();
}

class _PaymentDummyPageState extends State<PaymentDummyPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ContestDetails()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.white,
      body: Center(
        child: Text(
          'Here payment will be handled.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: CustomTheme.t1,
          ),
        ),
      ),
    );
  }
}
