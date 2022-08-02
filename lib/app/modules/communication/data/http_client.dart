import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  //Metodo GET sem a necessidade de Token
  Future<http.Response> getDataNoToken(String url) async {
    return await http.get(Uri.parse(url));
  }

  //Metodo POST sem a necessidade de Token
  postDataNoToken(Map body, String url) async {
    return await http.post(Uri.parse(url), body: body);
  }

  //Metodo PUT sem a necessidade de Token
  putDataNoToken(Map body, String url) async {
    return await http.put(Uri.parse(url), body: body);
  }

  //bearer token -- Metodo POST com a necessidade de Token
  postDataWithToken(Map body, String url, String token) async {
    return await http.post(Uri.parse(url), body: body, headers: {
      'Authorization': 'Bearer $token',
    });
  }

  //bearer token -- Metodo Atualiza
  putDataWithToken(Map body, String url, String token) async {
    return await http.put(Uri.parse(url), body: json.encode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  //bearer token -- Metodo GET com a necessidade de Token
  Future getDataWithToken(String url, String token) async {
    return await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });
  }
}
