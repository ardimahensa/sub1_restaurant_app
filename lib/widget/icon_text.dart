import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final Color iconColor;
  final IconData icon;

  const IconWithText({
    super.key,
    required this.text,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
