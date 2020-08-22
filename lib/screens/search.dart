import 'package:imacoustic/config/palette.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class Exercise {
  final String name;
  final String author;
  final String minutes;
  final String exerciseID;

  Exercise(this.name, this.author, this.minutes, this.exerciseID);
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  List<Exercise> exercises = [
    Exercise('Perfect', 'Ed-Sheeran', '5', 'A01'),
    Exercise('Shape of you', 'Ed-Sheeran', '5', 'B01'),
    Exercise('Thinking out loud', 'Ed-Sheeran', '5', 'C01'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
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
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Songs'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Chords'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Scale'),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.appbar,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width * .9,
                child: TextField(
                  decoration: InputDecoration(
                    suffix: FaIcon(
                      FontAwesomeIcons.search,
                      color: Palette.white20,
                      size: 16,
                    ),
                    hintText: 'Search for songs',
                    hintStyle: TextStyle(color: Palette.white20, fontSize: 16),
                    isDense: false,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Recent Post',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Divider(
              color: Palette.white10,
              height: 15,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            for (Exercise exercise in exercises)
              Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Palette.sky,
                      ),
                      width: 5,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: FlatButton(
                        color: Palette.appbar65,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
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
                                      '${exercise.name}',
                                      style: TextStyle(color: Palette.text),
                                    ),
                                    Text(
                                      '${exercise.author}',
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
                                      text: '${exercise.minutes}',
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
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
