// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class ContestRegistrationPage extends StatefulWidget {
//   const ContestRegistrationPage({super.key});

//   @override
//   State<ContestRegistrationPage> createState() => _ContestRegistrationPageState();
// }

// class _ContestRegistrationPageState extends State<ContestRegistrationPage> {
//     late Razorpay _razorpay;

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     // ToastService.showToast("Payment successful", context);

//     // Map body = {
//     //   "notes": {},
//     //   "order_id": response.orderId.toString(),
//     //   // "payee_id": studentProvider.student.id,
//     //   "product_id": widget.event.id,
//     //   "payment_id": response.paymentId.toString(),
//     //   "signature": response.signature.toString(),
//     //   "status": "success",
//     //   "product": "event",
//     //   "title": widget.event.title,
//     // };

//     // Loader.show(
//     //   context,
//     //   isAppbarOverlay: true,
//     //   isBottomBarOverlay: true,
//     //   progressIndicator: const CircularProgressIndicator(),
//     //   themeData: Theme.of(context).copyWith(
//     //       colorScheme: ColorScheme.fromSwatch().copyWith(
//     //           secondary: Colors.black38,
//     //           primary: HexColor(primaryColorString))),
//     // );
//     // var payment = await PaymentService().postPayment(body);
//     // if (payment) {
//     //   // Loader.hide();
//     //   // Map data = {
//     //   //   "event_id": widget.event.id,
//     //   //   "student_id": studentProvider.student.id,
//     //   // };
//     //   // EventService().postEvent(data);
//     //   // Navigator.popUntil(context, (route) => route.isFirst);
//     //   Navigator.pushReplacement(
//     //     context,
//     //     MaterialPageRoute(
//     //       builder: (_) => EventPaymentResultPage(
//     //         event: widget.event,
//     //         successful: true,
//     //       ),
//     //     ),
//     //   );
//     // } else {
//     //   Navigator.pushReplacement(
//     //     context,
//     //     MaterialPageRoute(
//     //       builder: (_) => EventPaymentResultPage(
//     //         event: widget.event,
//     //         successful: false,
//     //       ),
//     //     ),
//     //   );
//     // }
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Logger().e(response.message);
//     // Navigator.pushReplacement(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (_) => EventPaymentResultPage(
//     //       event: widget.event,
//     //       successful: false,
//     //     ),
//     //   ),
//     // );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ToastService.showToast("External wallet failed", context);
//     /* Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }

//   Future<String> generateOrderId(String key, String secret, int amount) async {
//     var auth = 'Basic ' + base64Encode(utf8.encode('$key:$secret'));
//     var headers = {
//       'content-type': 'application/json',
//       'Authorization': auth,
//     };

//     var data = '{ "amount": $amount, "currency": "INR"}';
//     var res = await http.post(Uri.parse('https://api.razorpay.com/v1/orders'),
//         headers: headers, body: data);

//     // Logger().i(res.body);
//     if (res.statusCode != 200) {
//       throw Exception('http.post error: statusCode= ${res.statusCode}');
//     }
//     return json.decode(res.body)['id'].toString();
//   }

//   void openCheckout(Student student) async {
//     // Loader.show(
//     //   context,
//     //   isAppbarOverlay: true,
//     //   isBottomBarOverlay: true,
//     //   progressIndicator: const CircularProgressIndicator(),
//     //   themeData: Theme.of(context).copyWith(
//     //       colorScheme: ColorScheme.fromSwatch().copyWith(
//     //           secondary: Colors.black38,
//     //           primary: HexColor(primaryColorString))),
//     // );

//     print(int.parse(widget.event.fee.toString()) * 100);
//     print(widget.event.id);

//     var orderID = await PaymentService().getOrderID(
//         int.parse(widget.event.fee.toString()) * 100,
//         'event',
//         widget.event.id!);

//     // Logger().e(orderID);

//     // Loader.hide();

//     // var orderID = await generateOrderId("rzp_test_Qn8cONB2A2Qvpc",
//     //     "T5uPoJSvtKcPnlDzXO0mpPFp", int.parse(widget.event.fee.toString()) * 100);

//     var options = {
//       'order_id': orderID,
//       'key': 'rzp_test_Y4LloamQLkQgCp',
//       'amount': amount * 100,
//       'name': name,
//       'description': 'Contest Registration',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'email'},
//       'external': {
//         'wallets': ['paytm', 'gpay']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       // Logger().e(e);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
