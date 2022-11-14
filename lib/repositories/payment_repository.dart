import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PaymentService {
  // final storage = const FlutterSecureStorage();

  // postPayment(data) async {
  //   var url = Uri.parse('$baseUrl/payments/');
  //   String? token = await storage.read(key: "bearer");

  //   Map<String, String> header = {
  //     "Content-type": "application/json",
  //     HttpHeaders.authorizationHeader: "Bearer $token",
  //   };
  //   try {
  //     http.Response response = await http
  //         .post(url, headers: header, body: jsonEncode(data))
  //         .catchError((err) {
  //       Logger().e(err);
  //     });
  //     Logger().i(response.body);
  //     Logger().i(response.statusCode);
  //     if (response.statusCode != 201 && response.statusCode != 200) {
  //       return false;
  //     } else {
  //       var data = jsonDecode(response.body);
  //       return true;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // getOrderID(int amount, String product, String productId) async {
  //   var url = Uri.parse('$baseUrl/order-id');
  //   String? token = await storage.read(key: "bearer");

  //   Map<String, String> header = {
  //     "Content-type": "application/json",
  //     HttpHeaders.authorizationHeader: "Bearer $token",
  //   };

  //   try {
  //     http.Response response = await http
  //         .post(url, headers: header, body: jsonEncode({
  //           "amount": amount,
  //           "product": product,
  //           "product_id": productId
  //         }))
  //         .catchError((err) {
  //       Logger().i(err);
  //     });
  //     // Logger().i(response.body);
  //     // Logger().i(response.statusCode);
  //     if (response.statusCode != 201 && response.statusCode != 200) {
  //       return null;
  //     } else {
  //       var data = jsonDecode(response.body);
  //       return data["order_id"];
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
