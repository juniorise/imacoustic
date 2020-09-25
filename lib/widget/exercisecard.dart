import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key key,
    @required this.i,
    @required this.exercises,
  }) : super(key: key);

  final int i;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Palette.sky),
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
                              '${exercises[i].name}',
                              style: TextStyle(
                                color: Palette.text,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${exercises[i].author}',
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
                              text: '${exercises[i].minutes}',
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
    );
  }
}
