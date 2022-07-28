import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MainForm extends StatelessWidget {
  TextEditingController _controller;
  bool isObscured;
  MainForm(this._controller, this.isObscured, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: thirdColor,
        border: Border.all(color: secondColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextField(
          obscureText: isObscured,
          controller: _controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
              color: mainColor, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
