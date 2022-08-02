// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/home_store.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
// import 'package:speech_to_text/speech_to_text.dart' as speechToText;

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
  // late speechToText.SpeechToText speech;
  // String textString = "Press The Button";
  // bool isListen = false;
  // double confidence = 1.0;

  // void listenVoice() async {
  //   if (!isListen) {
  //     bool avail = await speech.initialize();
  //     if (avail) {
  //       setState(() {
  //         isListen = true;
  //       });
  //       speech.listen(onResult: (value) {
  //         setState(() {
  //           textString = value.recognizedWords;
  //           if (value.hasConfidenceRating && value.confidence > 0) {
  //             confidence = value.confidence;
  //           }
  //         });
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       isListen = false;
  //     });
  //     speech.stop();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _initSpeech();
    // speech = speechToText.SpeechToText();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      print(_lastWords);
    });
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
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          // tooltip: 'Listen',
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
