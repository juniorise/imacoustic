import 'package:imacoustic/config/palette.dart';

class BottomNavigationItem extends StatefulWidget {
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
  _BottomNavigationItemState createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: widget.onPressed,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: widget.icon != null
            ? FaIcon(
                widget.icon,
                color: widget.index == widget.active
                    ? Palette.sky
                    : Colors.white,
              )
            : widget.image,
      ),
    );
  }
}
