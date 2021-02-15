import 'dart:convert';

import 'package:http/http.dart' as https;

class Api {
  var url =
      "https://firebasestorage.googleapis.com/v0/b/android-interview-test.appspot.com/o/campaigns.json?alt=media&token=c4aa376e-d07a-49fd-b6d3-a2dd52e9c47f";

  Future<List<dynamic>> getCamp() async {
    try {
      var result = await https.get(url).timeout(Duration(minutes: 1));
      return jsonDecode(result.body);
    } catch (error) {
      print("error" + error.toString());
    }
  }
}
