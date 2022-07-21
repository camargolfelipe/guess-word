import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

class Mainkeyboard extends StatelessWidget {
  const Mainkeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: secondColor.withOpacity(0.3)),
        child: Wrap(
          direction: Axis.vertical,
          children: letters.map((letter) {
            return KeyboardLetter(letter);
          }).toList(),
        ));
  }
}

class KeyboardLine extends StatelessWidget {
  const KeyboardLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class KeyboardLetter extends StatefulWidget {
  String letter;
  KeyboardLetter(this.letter, {Key? key}) : super(key: key);

  @override
  State<KeyboardLetter> createState() => _KeyboardLetterState();
}

class _KeyboardLetterState extends State<KeyboardLetter> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
                  isChecked ? black.withOpacity(0.65) : black.withOpacity(0.3)),
          child: Center(
            child: Text(
              widget.letter,
              style: TextStyle(color: white),
            ),
          )),
    );
  }
}
