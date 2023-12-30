import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  const SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.height = 1.2,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          height: height,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          fontSize: size),
    );
  }
}
