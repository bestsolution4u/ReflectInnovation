import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflect_innovation/bloc/app_bloc.dart';
import 'package:reflect_innovation/bloc/bloc.dart';
import 'package:reflect_innovation/config/route.dart';
import 'package:reflect_innovation/config/style.dart';
import 'package:reflect_innovation/screen/auth/welcome_screen.dart';
import 'package:reflect_innovation/screen/main/main_screen.dart';
import 'package:reflect_innovation/screen/splash_screen.dart';

class ReflectApp extends StatefulWidget {
  @override
  _ReflectAppState createState() => _ReflectAppState();
}

class _ReflectAppState extends State<ReflectApp> {

  final routes = Routes();

  @override
  void initState() {
    super.initState();
    AppBloc.applicationBloc.add(ApplicationStartEvent());
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
        providers: AppBloc.blocProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routes.generateRoute,
          theme: ThemeData(
            primaryColor: Styles.backgroundGrey,
            platform: TargetPlatform.iOS,
            appBarTheme: AppBarTheme(color: Styles.backgroundGrey),
            fontFamily: 'ProximaNova',
          ),
          home: BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, appState) {
              if (appState is ApplicationStartedState) {
                return BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, authState) {
                      if (authState is AuthSuccessState) {
                        return MainScreen();
                      } else if (authState is AuthFailedState) {
                        return WelcomeScreen();
                      }
                      return SplashScreen();
                    },
                );
              }
              return SplashScreen();
            },
          ),
        )
    );
  }
}
