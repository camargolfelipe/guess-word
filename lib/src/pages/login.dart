import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../components/forms.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Strings strings = Strings();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logo.PNG'), fit: BoxFit.fitWidth),
            ),
          ),
          MainForm(user, false),
          MainForm(pass, true),
          PrimaryButton(strings.done, () {
            Navigator.pushNamed(context, '/home');
          }),
        ],
      ),
    );
  }
}
