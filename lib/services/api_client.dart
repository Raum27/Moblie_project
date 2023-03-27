import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p_anonymus/module/contents.dart';

import '../module/test.dart';
import '../module/textsummary.dart';

class ApiClient {
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
    var uri = Uri.parse('${apiBaseUrl}/contents');
    var response = await http.get(uri);
    List result = jsonDecode(utf8.decode(response.bodyBytes));
    return result.map((item) => Contents.fromJson(item)).toList();
  }

  Future<Textsummarizer?> summarizer() async {
    Uri uri = Uri.parse('${apiBaseUrl}/summarizer');
    var response = await http.get(uri);
    var result = jsonDecode(utf8.decode(response.bodyBytes));
    return Textsummarizer.fromJson(result);
  }
}

void check_out() async {
  var ccc = await ApiClient().summarizer();
  print(ccc!.contents);
}

void main() {
  check_out();
}
