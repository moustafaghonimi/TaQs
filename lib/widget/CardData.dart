import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  String str1;
  String str2;
  String str3;
  String str4;
  Icon icons;
  double page;
  double offset;

  CardData(
      {required this.offset,
      required this.str1,
      required this.str2,
      this.str3 = '',
      this.str4 = '',
      required this.icons,
      required this.page});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white70,
      Colors.blue,
      Colors.yellow,
      Colors.red,
      Colors.pinkAccent,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,
      fontFamily: 'Horizon',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(-offset * MediaQuery.of(context).size.width / 2, 0),
        ),
        // Transform.translate(
        //   offset: Offset(-offset * MediaQuery.of(context).size.width / 2, 0),
        //   child: Text(
        //     str1,
        //     style: TextStyle(fontSize: 30),
        //   ),
        // ),
        ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: icons),
        SizedBox(
          width:MediaQuery.of(context).size.width*.6,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              fontFamily: 'Canterbury',
            ),
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              totalRepeatCount: 100,

              animatedTexts: [
                ScaleAnimatedText(str1,),
                ScaleAnimatedText(str2),
                ScaleAnimatedText(str3),
                ScaleAnimatedText(str4),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),

      ],
    );
  }
}
