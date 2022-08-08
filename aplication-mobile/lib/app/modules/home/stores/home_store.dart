import 'package:bottcc/app/modules/communication/data/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> sendVoiceText(BuildContext context, String voiceText) async {
    HttpClient _client = Modular.get();
    try {
      Map<String, dynamic> body = {'body': voiceText};
      Response response = await _client.postDataNoToken(
          body, 'http://10.0.2.2:8000/nlpbot/post');
      if (response.statusCode >= 200 && response.statusCode <= 202) {
        receiverVoiceText();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> receiverVoiceText() async {
    HttpClient _client = Modular.get<HttpClient>();
    try {
      Response response =
          await _client.getDataNoToken('http://10.0.2.2:8000/nlpbot/get');
      if (response.statusCode >= 200 && response.statusCode <= 202) {
        print(response.body);
      }
    } finally {
      // _client.close();
    }
  }
}
