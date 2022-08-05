import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<http.Response> getDataNoToken(String url) async {
    return await http.get(Uri.parse(url));
  }

  postDataNoToken(Map body, String url) async {
    print(Uri.parse(url));
    print(body);
    return await http.post(Uri.parse(url), body: body);
  }

  putDataNoToken(Map body, String url) async {
    return await http.put(Uri.parse(url), body: body);
  }

  postDataWithToken(Map body, String url, String token) async {
    return await http.post(Uri.parse(url), body: body, headers: {
      'Authorization': 'Bearer $token',
    });
  }

  putDataWithToken(Map body, String url, String token) async {
    return await http.put(Uri.parse(url), body: json.encode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  Future getDataWithToken(String url, String token) async {
    return await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });
  }
}
