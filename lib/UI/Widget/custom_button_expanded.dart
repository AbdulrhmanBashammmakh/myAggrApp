import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomButtonExpanded extends StatelessWidget {
  CustomButtonExpanded(
      {Key? key,
      required this.padding,
      this.onPress,
      required this.textname,
      required this.color})
      : super(key: key);

  final String textname;
  final Color color;
  final double padding;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(padding),
      child: CustomButton(
        text: textname,
        onPress: onPress,
        color: color,
      ),
    );
  }
}
