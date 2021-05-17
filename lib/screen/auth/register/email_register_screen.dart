import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:reflect_innovation/config/style.dart';
import 'package:reflect_innovation/screen/auth/register/email_verification_screen.dart';
import 'package:reflect_innovation/widget/ripple_component.dart';

class EmailRegisterScreen extends StatefulWidget {
  @override
  _EmailRegisterScreenState createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 500,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<ScreenHeight>(
          builder: (context, value, child) {

          return Stack(
            children: [
              Image.asset(
                'asset/image/bg_artwork.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 200,),
                    Text('Enter\nyour email', style: TextStyle(fontFamily: 'LibreBaskervilleBold', fontSize: 36, color: Styles.textBlack),),
                    SizedBox(height: 50,),
                    TextField(
                      controller: _controller,
                      style: TextStyle(
                        color: Styles.textBlack,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    curve: Curves.linear,
                    duration: Duration(
                      milliseconds: 100,
                    ),
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.only(bottom: value.keyboardHeight),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        RippleComponent(
                          borderRadius: 0,
                          onClick: () {
                            if (_controller.text.isNotEmpty) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(email: _controller.text,),));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('NEXT', style: TextStyle(color: _controller.text.isNotEmpty ? Styles.mainBlue : Colors.grey, fontSize: 14),),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_right_alt, size: 20, color: _controller.text.isNotEmpty ? Styles.mainBlue : Colors.grey,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          );
        },),
      ),
    );
  }
}
