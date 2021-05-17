import 'package:flutter/material.dart';

class MainTabItem extends StatefulWidget {

  final String icon;
  final bool selected;

  MainTabItem({this.icon, this.selected});

  @override
  _MainTabItemState createState() => _MainTabItemState();
}

class _MainTabItemState extends State<MainTabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        children: [
          Center(
            child: Image.asset(widget.icon, width: 20, height: 20, color: widget.selected ? Color(0xFF61B8BB) : Color(0xFF90908F),),
          ),
          Positioned(
            top: 0,
              child: Container(
                width: 48,
                height: 1,
                color: widget.selected ? Color(0xFF61B8BB) : Colors.transparent,
              )
          )
        ],
      ),
    );
  }
}
