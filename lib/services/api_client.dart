import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p_anonymus/module/contents.dart';
import '../module/checkiduser.dart';
import '../module/textsummary.dart';

class ApiClientServer {
  static const apiBaseUrl = 'http://127.0.0.1:8000';
  Future loaddata() async {
    Uri uri = Uri.parse(apiBaseUrl);
    var result;
    try {
      var res = await http.get(uri);
      result = jsonDecode(res.body);
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<List<Contents>>? getAllcontents() async {
    var uri = Uri.parse('${apiBaseUrl}/Sepcontents');
    var response = await http.get(uri);
    List result = jsonDecode(utf8.decode(response.bodyBytes));
    return result.map((item) => Contents.fromJson(item)).toList();
  }

  Future<Textsummarizer?> summarizer(String str) async {
    Uri uri = Uri.parse('${apiBaseUrl}/summarizer/?text=${str}');
    var response = await http.get(uri);
    var result = jsonDecode(utf8.decode(response.bodyBytes));
    return Textsummarizer.fromJson(result);
  }

  Future<bool>? register(String str) async {
    Uri uri = Uri.parse('${apiBaseUrl}/register');
    // print(str);
    var response = await http.post(uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'ID': str,
        }));
    try {
      // print(response.body);

      /// เปลี่ยน
    } catch (e) {
      // print(e);
    }
    return true;
  }

  Future<UserIDcheck?> login(String str) async {
    Uri uri = Uri.parse('${apiBaseUrl}/login');
    // print(str);
    var response = await http.post(uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'ID': str,
        }));
    try {
      // print(response.body);
    } catch (e) {
      // print(e);
    }
    var result = jsonDecode(response.body);
    return UserIDcheck.fromJson(result);
  }
}

void check_out() async {
  var ccc = await ApiClientServer().login("0927858281");
  if (ccc == true) {
    print("hool");
  }
  // var ccc = await ApiClient().getAllcontents();
  print(ccc);
}

// Future<bool?> check_in() async {
//   var ccc = await ApiClientServer().login("0927858281");
//   return ccc;
// }

// void main() {
//   check_out();
// }
