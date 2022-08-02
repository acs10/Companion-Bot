import 'package:bottcc/app/modules/communication/data/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> sendVoiceText(BuildContext context, String voiceText) async {
    print(voiceText);
    HttpClient _client = Modular.get<HttpClient>();
    try {
      Map<String, dynamic> body = {'voiceText': voiceText};
      Response response = await _client.putDataNoToken(body, voiceText);
      if (response.statusCode >= 200 && response.statusCode <= 202) {
        print("send message ok");
      }
    } catch (e) {
      print(e);
    }
  }
}
