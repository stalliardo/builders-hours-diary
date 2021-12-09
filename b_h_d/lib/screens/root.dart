import 'package:b_h_d/screens/home.dart';
import 'package:b_h_d/screens/splash.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Widget _loadScreen(ApplicationLoginState _loginState) {
    Widget screenLoader = SplashScreen();

    switch (_loginState) {
      case ApplicationLoginState.unknown:
        // retVal = SplashScreen();
        break;
      case ApplicationLoginState.loggedOut:
        screenLoader = Home();
        break;
      case ApplicationLoginState.loggedIn:
        // retVal = StreamProvider<UserModel>.value(
        //   value: DBStream().getCurrentUser(currentUid),
        //   child: LoggedIn(),
        // );

        screenLoader = Home();
        break;
      default:
    }
    return screenLoader;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, appstate, _) => _loadScreen(appstate.loginState));
  }
}
