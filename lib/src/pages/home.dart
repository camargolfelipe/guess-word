import 'package:flutter/material.dart';
import 'package:guessWord/src/utils/routes.dart';
import 'package:line_icons/line_icons.dart';
import 'package:guessWord/main.dart';
import 'package:guessWord/src/utils/colors.dart';
import 'package:guessWord/src/utils/strings.dart';
import '../components/home/keyboard.dart';
import '../components/home/wordTry.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController fifth = TextEditingController();
  bool secondIsVisible = false;
  bool thirdIsVisible = false;
  bool fourthIsVisible = false;
  bool fifthIsVisible = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Strings string = Strings();
    Routes route = Routes();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
          title: Text(string.app_bar),
          actions: [
            IconButton(
              icon: Icon(
                LineIcons.music,
                color: enableSound() ? green : secondColor,
              ),
              onPressed: () {
                if (enableSound()) {
                  setState(() {
                    storage.write('sound', null);
                    assetsAudioPlayer.stop();
                  });
                } else {
                  setState(() {
                    storage.write('sound', true);
                    assetsAudioPlayer.open(
                        Playlist(audios: [
                          Audio("assets/sound/background-sound-two.mp3"),
                        ]),
                        volume: 0.5,
                        loopMode: LoopMode.playlist);
                  });
                }
              },
            ),
            IconButton(
              icon: Icon(
                LineIcons.info,
                color: secondColor,
              ),
              onPressed: () {
                route.simple(context, '/ranking');
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: green,
          onPressed: () {
            if (!isEnabletoNext()) {
              _scaffoldKey.currentState?.showSnackBar(SnackBar(
                content: Text(string.fill_all_fields),
                duration: const Duration(seconds: 1),
              ));
            } else {
              nextTry();
            }
          },
          child: Icon(
            LineIcons.check,
            color: white,
          ),
        ),
        body: Builder(
            builder: (context) => ListView(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: Column(
                      children: [
                        WordTry(true, first, second, third, fourth, fifth,
                            isSaved('firstTry'), 'firstTry'),
                        WordTry(secondIsVisible, first, second, third, fourth,
                            fifth, isSaved('secondTry'), 'secondTry'),
                        WordTry(thirdIsVisible, first, second, third, fourth,
                            fifth, isSaved('thirdTry'), 'thirdTry'),
                        WordTry(fourthIsVisible, first, second, third, fourth,
                            fifth, isSaved('fourthTry'), 'fourthTry'),
                        WordTry(fifthIsVisible, first, second, third, fourth,
                            fifth, isSaved('fifthTry'), 'fifthTry'),
                      ],
                    ),
                  ),
                  const Mainkeyboard(),
                ])));
  }

  isSaved<bool>(str) {
    if (storage.read(str) == null) {
      return false;
    } else {
      return true;
    }
  }

  isEnabletoNext<bool>() {
    if (first.text.isNotEmpty &&
        second.text.isNotEmpty &&
        third.text.isNotEmpty &&
        fourth.text.isNotEmpty &&
        fifth.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void nextTry() {
    if (!secondIsVisible) {
      setState(() {
        storage.write('firstTry',
            [first.text, second.text, third.text, fourth.text, fifth.text]);
        secondIsVisible = true;
        cleanInput();
      });
    } else if (!thirdIsVisible) {
      setState(() {
        storage.write('secondTry',
            [first.text, second.text, third.text, fourth.text, fifth.text]);
        thirdIsVisible = true;
        cleanInput();
      });
    } else if (!fourthIsVisible) {
      setState(() {
        storage.write('thirdTry',
            [first.text, second.text, third.text, fourth.text, fifth.text]);
        fourthIsVisible = true;
        cleanInput();
      });
    } else if (!fifthIsVisible) {
      setState(() {
        storage.write('fourthTry',
            [first.text, second.text, third.text, fourth.text, fifth.text]);
        fifthIsVisible = true;
        cleanInput();
      });
    } else {
      cleanStorage();
      secondIsVisible = false;
      thirdIsVisible = false;
      fourthIsVisible = false;
      fifthIsVisible = false;
      first.clear();
    }
  }

  bool enableSound() {
    if (storage.read('sound') == null) {
      return false;
    } else {
      return true;
    }
  }

  void cleanInput() {
    first.clear();
    second.clear();
    third.clear();
    fourth.clear();
    fifth.clear();
  }

  void cleanStorage() {
    setState(() {
      cleanStorage();
      secondIsVisible = false;
      thirdIsVisible = false;
      fourthIsVisible = false;
      fifthIsVisible = false;
      first.clear();
      second.clear();
      third.clear();
      fourth.clear();
      fifth.clear();
    });
  }
}
