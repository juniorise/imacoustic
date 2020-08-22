import 'package:imacoustic/config/palette.dart';

class BottomNavigationItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final int index;
  final int active;
  final Image image;
  final Function onPressed;

  const BottomNavigationItem(
      {Key key,
      @required this.name,
      @required this.icon,
      @required this.index,
      @required this.active,
      this.image,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 55,
        height: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? FaIcon(
                    icon,
                    color: index == active ? Palette.sky : Colors.white,
                  )
                : image,
            index == active
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 10, color: Palette.sky),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
