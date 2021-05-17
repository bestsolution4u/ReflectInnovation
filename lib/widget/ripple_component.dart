import 'package:flutter/material.dart';

class RippleComponent extends StatefulWidget {

  final Widget child;
  final VoidCallback onClick;
  final double borderRadius;

  RippleComponent({this.child, this.onClick, this.borderRadius = 25});

  @override
  _RippleComponentState createState() => _RippleComponentState();
}

class _RippleComponentState extends State<RippleComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                onTap: widget.onClick,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ))
      ],
    );
  }
}
