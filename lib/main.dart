import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/screens/roots/root.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Quicksand',
          backgroundColor: Palette.background,
          primaryColor: Palette.appbar,
          canvasColor: Palette.background,
          errorColor: Palette.red,
          splashColor: Palette.white20,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/splashscreen': (context) => SplashScreen(),
          '/': (context) => Root(),
        },
      ),
    );

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
