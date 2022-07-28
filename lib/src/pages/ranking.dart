import 'package:flutter/material.dart';
import 'package:guessWord/src/utils/colors.dart';
import 'package:guessWord/src/utils/strings.dart';
import 'package:line_icons/line_icons.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings string = Strings();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(string.ranking),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            var count = 12 - index;
            return RankingItems('lfelipe', count, index);
          }),
    );
  }
}

class RankingItems extends StatelessWidget {
  int rankingCount;
  int rankingPodium;
  String userName;
  RankingItems(this.userName, this.rankingCount, this.rankingPodium, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(12.0),
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondColor,
          border: Border.all(color: thirdColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: position(rankingPodium)),
              Expanded(
                flex: 8,
                child: Text(userName,
                    style: TextStyle(color: mainColor, fontSize: 20.0)),
              ),
              Expanded(
                  flex: 2,
                  child: Text(rankingCount.toString(),
                      style: TextStyle(
                          color: black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ));
  }
}

position(int position) {
  switch (position) {
    case 0:
      return Icon(
        LineIcons.trophy,
        size: 40,
        color: yellow,
      );
    case 1:
      return Icon(
        LineIcons.medal,
        size: 32,
        color: grey,
      );
    case 2:
      return Icon(
        LineIcons.medal,
        size: 32,
        color: brown,
      );

    default:
      return Icon(
        LineIcons.thumbsDown,
        size: 24,
        color: red,
      );
  }
}
