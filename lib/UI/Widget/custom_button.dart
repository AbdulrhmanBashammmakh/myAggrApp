import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:myaggr/UI/Constant/colors_constant.dart';
import 'package:myaggr/UI/Widget/custom_text.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onPress;

  const CustomButton({
    Key? key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = Constants.primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Constants.primaryColor)),
        padding: const EdgeInsets.all(18),
        primary: color,
        elevation: 0.0,
      ),
      onPressed: onPress,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: textColor,
      ),
    );
  }
}