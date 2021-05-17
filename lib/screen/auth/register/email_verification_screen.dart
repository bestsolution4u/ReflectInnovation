import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:reflect_innovation/bloc/authentication/authentication_bloc.dart';
import 'package:reflect_innovation/bloc/bloc.dart';
import 'package:reflect_innovation/config/style.dart';
import 'package:reflect_innovation/widget/ripple_component.dart';

class EmailVerificationScreen extends StatefulWidget {

  final String email;

  EmailVerificationScreen({this.email});

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
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
                      Text('Verification', style: TextStyle(fontFamily: 'LibreBaskervilleBold', fontSize: 36, color: Styles.textBlack),),
                      SizedBox(height: 30,),
                      Text('We sent you verification email to ${widget.email}', style: TextStyle(color: Styles.textBlack, fontSize: 18),),
                      SizedBox(height: 20,),
                      Text('Please check your inbox', style: TextStyle(color: Styles.textBlack, fontSize: 18),),
                      SizedBox(height: 80,),
                      Text('If you didn’t get an email, please check  your Spam and Junk folders', style: TextStyle(color: Styles.lightGrey, fontSize: 12),),
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
                              _authBloc.add(AuthFinishEvent(email: widget.email));
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('NEXT', style: TextStyle(color: Styles.mainBlue, fontSize: 14),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_right_alt, size: 20, color: Styles.mainBlue,)
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
