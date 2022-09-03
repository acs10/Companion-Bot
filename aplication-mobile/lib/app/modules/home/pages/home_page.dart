// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/home_store.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeStore homeStore = Modular.get();
  late TabController _tabController;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  TextToSpeech tts = TextToSpeech();

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  void sendMessageStore() {
    Timer(const Duration(seconds: 5), () {
      homeStore.sendVoiceText(context, _lastWords);
    });
    // print(_lastWords);
    // tts.speak(_lastWords);
    //Speech_to_text
    // homeStore.sendVoiceText(context, _lastWords);
    // homeStore.receiverVoiceText();
    //text_to_speech
    // tts.speak(_lastWords);
  }

  final _kTabPages = <Widget>[
    // ignore: prefer_const_constructors
    Padding(
      padding: const EdgeInsets.only(top: 250.0),
      child: const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Toque para falar',
              style: TextStyle(fontSize: 14, color: Colors.black)),
        ),
      ),
    ),

    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Inicial'),
    Tab(icon: Icon(Icons.note), text: 'Lembretes'),
    Tab(icon: Icon(Icons.view_agenda), text: 'Agenda'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Color(0xff00D4FF),
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 235.0),
        child: FlatButton(
          onPressed: () => {
            if (_speechToText.isNotListening)
              {
                _startListening(),
                sendMessageStore(),
              }
            else
              _stopListening()
          },
          child: Image.asset(
            "lib/app/modules/home/assets/homePage/speak.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
