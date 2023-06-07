import 'dart:convert';

import 'package:http/http.dart';

class SendAdressRepository {
  static Future<bool> sendAdress(Map<String, dynamic> pswData) async {
    try {
      String tok = 'Wr13dcc34SDC231';
      Response response = await post(
        Uri.parse('https://food-battle-app.onrender.com/send'),
        headers: {
          'Authorization': tok,
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(pswData),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
