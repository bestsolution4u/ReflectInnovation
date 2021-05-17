import 'package:flutter/material.dart';
import 'package:reflect_innovation/bloc/bloc.dart';
import 'package:reflect_innovation/config/style.dart';
import 'package:reflect_innovation/screen/auth/register/email_register_screen.dart';
import 'package:reflect_innovation/widget/button/app_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                Expanded(flex: 2, child: Container()),
                Padding(padding: const EdgeInsets.only(left: 10), child: Text('Sign in to your\nReflect account', style: TextStyle(fontFamily: 'LibreBaskervilleBold', fontSize: 36, color: Styles.textBlack),),),
                SizedBox(height: 20,),
                Padding(padding: const EdgeInsets.only(left: 10), child: Text('If you already have an account -   sign up with same credentials  signed in previously', style: TextStyle(color: Styles.textBlack, fontSize: 16),),),
                Expanded(flex: 3, child: Container()),
                AppButton(
                  text: 'SIGN UP WITH FACEBOOK',
                  backgroundColor: Color(0x60FFFFFF),
                  onClick: () {
                    _authBloc.add(AuthFinishEvent(email: 'test@gmail.com'));
                  },
                ),
                SizedBox(height: 10,),
                Center(child: Text('We will never post on Facebook', style: TextStyle(color: Color(0xFF90908F), fontSize: 14), textAlign: TextAlign.center),),
                SizedBox(height: 40,),
                AppButton(
                  text: 'SIGN UP WITH EMAIL',
                  backgroundColor: Color(0x60FFFFFF),
                  onClick: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailRegisterScreen(),));
                  },
                ),
                SizedBox(height: 30,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
