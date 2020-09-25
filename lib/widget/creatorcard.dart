import 'package:imacoustic/config/palette.dart';

class CreatorCard extends StatelessWidget {
  final String path;
  final String name;
  final String describe;
  final Function onPressed;

  const CreatorCard(
      {Key key,
      @required this.path,
      @required this.name,
      @required this.describe,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      child: FlatButton(
        highlightColor: Palette.sky,
        color: Palette.appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Image.asset(
                  '$path',
                  width: 40,
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              describe,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
