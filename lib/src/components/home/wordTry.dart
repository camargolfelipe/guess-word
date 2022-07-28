import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guessWord/src/utils/strings.dart';
import '../../../main.dart';
import '../../utils/colors.dart';

class WordTry extends StatelessWidget {
  bool isVisible;
  TextEditingController first;
  TextEditingController second;
  TextEditingController third;
  TextEditingController fourth;
  TextEditingController fifth;
  bool isAlreadySaved;
  String storageKey;
  WordTry(this.isVisible, this.first, this.second, this.third, this.fourth,
      this.fifth, this.isAlreadySaved, this.storageKey,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordTryLetter(
              isAlreadySaved ? _controller(storage.read(storageKey)[0]) : first,
              0),
          WordTryLetter(
              isAlreadySaved
                  ? _controller(storage.read(storageKey)[1])
                  : second,
              1),
          WordTryLetter(
              isAlreadySaved ? _controller(storage.read(storageKey)[2]) : third,
              2),
          WordTryLetter(
              isAlreadySaved
                  ? _controller(storage.read(storageKey)[3])
                  : fourth,
              3),
          WordTryLetter(
              isAlreadySaved ? _controller(storage.read(storageKey)[4]) : fifth,
              4)
        ],
      ),
    );
  }

  TextEditingController _controller(content) {
    return TextEditingController(text: content);
  }
}

class WordTryLetter extends StatelessWidget {
  TextEditingController controller;
  int index;
  WordTryLetter(this.controller, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        border: Border.all(color: secondColor, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: colorTreatment(controller.text, index),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
              color: white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

colorTreatment(String str, int index) {
  if (str == dayword[index]) {
    return green.withOpacity(0.5);
  } else if (dayword.contains(str)) {
    return yellow.withOpacity(0.5);
  } else if (str.isEmpty) {
    return black.withOpacity(0.5);
  } else {
    return grey.withOpacity(0.5);
  }
}
