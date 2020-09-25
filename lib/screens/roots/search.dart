import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/data/exericses.dart';
import 'package:imacoustic/widget/exercisecard.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
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
          bottom: PreferredSize(
            child: Column(
              children: [
                TabBar(
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
                SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Palette.white10,
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
                        hintStyle: TextStyle(
                            color: Palette.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                        isDense: false,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            preferredSize: Size(100, 120),
          ),
        ),
        body: ListView(
          children: <Widget>[
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
            for (int i = 0; i < exercises.length; i++)
              ExerciseCard(i: i, exercises: exercises)
          ],
        ),
      ),
    );
  }
}
