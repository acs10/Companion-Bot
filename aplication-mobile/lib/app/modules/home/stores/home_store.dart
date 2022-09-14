import 'package:bottcc/app/modules/communication/data/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart';
import 'package:text_to_speech/text_to_speech.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);
  TextToSpeech tts = TextToSpeech();

  Future<void> sendVoiceText(BuildContext context, String voiceText) async {
    HttpClient _client = Modular.get();
    try {
      Map<String, dynamic> body = {'body': voiceText};
      Response response = await _client.postDataNoToken(
          body, 'http://192.168.137.1:8000/nlpbot/send');
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
          await _client.getDataNoToken('http://192.168.137.1:8000/nlpbot/send');
      if (response.statusCode >= 200 && response.statusCode <= 202) {
        String result = response.body;
        List result2 = result.split('"body":"');
        List result3 = result2[1].split('"}]');
        tts.speak(result3[0]);
      }
    } catch (e) {
      print(e);
    }
  }
}
