import 'package:imacoustic/config/palette.dart';

class CreateExercise extends StatefulWidget {
  CreateExercise({Key key}) : super(key: key);

  @override
  _CreateExerciseState createState() => _CreateExerciseState();
}

class _CreateExerciseState extends State<CreateExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Exercise',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
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
                                    'Type anythings',
                                    style: TextStyle(
                                      color: Palette.text,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Author name',
                                    style: TextStyle(color: Palette.text),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    color: Palette.text),
                                children: [
                                  TextSpan(
                                    text: '5',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'mn',
                                  ),
                                ],
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
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tabs',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Click on any fret to create your own exercise.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 225,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/frets.png',
                        fit: BoxFit.fitHeight,
                      ),
                      Positioned(
                        top: 10,
                        left: 63,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Palette.sky,
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 128,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Palette.sky,
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
