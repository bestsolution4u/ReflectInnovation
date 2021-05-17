import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('asset/image/bg_artwork.png', width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
          Center(
            child: Image.asset('asset/image/reflect.png', width: double.infinity, fit: BoxFit.fitWidth,),
          )
        ],
      ),
    );
  }
}
