import 'package:flutter/material.dart';
import 'package:reflect_innovation/widget/ripple_component.dart';

class AppButton extends StatelessWidget {

  final VoidCallback onClick;
  final String text;
  final Widget icon;
  final Color backgroundColor, borderColor, textColor;
  final double fontSize, paddingVertical;

  AppButton({this.onClick, this.text, this.icon, this.backgroundColor = Colors.white, this.borderColor = Colors.white, this.textColor = Colors.black, this.fontSize = 14, this.paddingVertical = 15});

  @override
  Widget build(BuildContext context) {
    return RippleComponent(
      onClick: onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: borderColor, width: 1)
            ),
        child: Stack(
          children: [
            Center(
              child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}
