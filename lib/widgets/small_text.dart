import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SmallText extends StatelessWidget {
  Color? color;
  double size;
  final String text;
  TextOverflow overFlow;
  double height;

  SmallText({Key? key,
  required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    this.overFlow = TextOverflow.visible,
    this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        overflow: overFlow,
        fontSize: size,
        color: color,
        height: height,
      ),

    );
  }
}
