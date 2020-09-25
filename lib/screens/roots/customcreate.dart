import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/screens/customcreate/create_exercise.dart';
import 'package:imacoustic/widget/creatorcard.dart';

class CustomCreateScreen extends StatefulWidget {
  CustomCreateScreen({Key key}) : super(key: key);

  @override
  _CustomCreateScreenState createState() => _CustomCreateScreenState();
}

class ExerciseCreate {
  final String name;
  final String author;
  final String minutes;
  final String exerciseID;
  final bool isPublished;

  ExerciseCreate(
      this.name, this.author, this.minutes, this.exerciseID, this.isPublished);
}

class _CustomCreateScreenState extends State<CustomCreateScreen> {
  List<ExerciseCreate> _exerciseCreate = [
    ExerciseCreate('Perfect', 'Ed-Sheeran', '5', 'A01', false),
    ExerciseCreate('Shape of you', 'Ed-Sheeran', '5', 'B01', true),
    ExerciseCreate('Thinking out loud', 'Ed-Sheeran', '5', 'C01', true),
    ExerciseCreate('Perfect', 'Ed-Sheeran', '5', 'A01', false),
    ExerciseCreate('Shape of you', 'Ed-Sheeran', '5', 'B01', true),
    ExerciseCreate('Thinking out loud', 'Ed-Sheeran', '5', 'C01', true),
    ExerciseCreate('Perfect', 'Ed-Sheeran', '5', 'A01', false),
    ExerciseCreate('Shape of you', 'Ed-Sheeran', '5', 'B01', true),
    ExerciseCreate('Thinking out loud', 'Ed-Sheeran', '5', 'C01', true),
  ];

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
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreatorCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateExercise(),
                    ),
                  );
                },
                path: 'assets/icons/Metronome.png',
                name: 'Exercise',
                describe: 'Create exercise for practice',
              ),
              CreatorCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateExercise(),
                    ),
                  );
                },
                path: 'assets/icons/Guitar.png',
                name: 'Fingerpicking',
                describe: 'Create tabs for a song',
              )
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Recent Post',
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
          for (int i = 0; i < _exerciseCreate.length; i++)
            Container(
              height: 70,
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Palette.sky),
                    width: 5,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Palette.appbar65,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          print(i);
                        },
                        highlightColor: Palette.sky,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Palette.icon,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.guitar,
                                      color: Palette.sky,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${_exerciseCreate[i].name}',
                                      style: TextStyle(
                                        color: Palette.text,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${_exerciseCreate[i].author}',
                                      style: TextStyle(color: Palette.text),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: !_exerciseCreate[i].isPublished
                                  ? FlatButton(
                                      highlightColor: Palette.sky,
                                      splashColor: Palette.sky,
                                      color: Palette.icon,
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Upload',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        'Published',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
