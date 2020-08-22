import 'package:imacoustic/config/palette.dart';

class Activity extends StatelessWidget {
  final Color color;
  final IconData icons;
  final String level;
  final String line1;
  final String line2;

  const Activity(
      {Key key,
      this.color = Palette.sky,
      this.icons = FontAwesomeIcons.guitar,
      @required this.level,
      @required this.line1,
      @required this.line2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Palette.appbar65),
          child: Center(
            child: FaIcon(
              icons,
              color: color,
              size: 18,
            ),
          ),
        ),
        Text(
          ' 10 ',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        Text(
          'Songs\nLearnt',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
