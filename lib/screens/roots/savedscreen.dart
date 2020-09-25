import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/data/exericses.dart';
import 'package:imacoustic/widget/exercisecard.dart';

class SavedScreen extends StatefulWidget {
  SavedScreen({Key key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 4.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/imacoustic_I.png',
              fit: BoxFit.fitWidth,
              width: 45,
            ),
            Text(
              ' Acoustic',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
      body: ListView(children: <Widget>[
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Saved Exercises',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Divider(
          color: Palette.white10,
          height: 15,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        for (int i = 0; i < exercises.length; i++)
          ExerciseCard(i: i, exercises: exercises)
      ]),
    );
  }
}
