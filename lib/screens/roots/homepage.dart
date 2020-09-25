import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/widget/activity.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class CategoryCard {
  final String title;
  final String describe;
  final int complete;
  final int total;
  final String image;
  CategoryCard(
    this.title,
    this.describe,
    this.complete,
    this.total,
    this.image,
  );
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _sliderController;
  int _currentCateIndex = 0;
  List<CategoryCard> category = [
    CategoryCard(
      'Fingerstyle',
      'Practice 15 minutes per day. You choose where to start with your skill.',
      5,
      10,
      'images/holdguitar.png',
    ),
    CategoryCard(
      'Scale',
      'Practice with hundren of scales.',
      5,
      10,
      'images/backguitar.png',
    ),
    CategoryCard(
      'Trainer',
      'Train your ear, and test your understanding on music theory.',
      5,
      10,
      'images/holdguitar.png',
    ),
  ];

  @override
  void initState() {
    _sliderController = PageController(
        initialPage: _currentCateIndex, keepPage: false, viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double headerRadius = 20;
    double mediaWidth = MediaQuery.of(context).size.width;
    //double mediaHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADER
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(headerRadius),
                bottomLeft: Radius.circular(headerRadius),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/strumming.png',
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(headerRadius),
                      bottomLeft: Radius.circular(headerRadius),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Palette.appbar70,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(headerRadius),
                        bottomLeft: Radius.circular(headerRadius),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    //HELLO HEADER
                    Container(
                      width: mediaWidth * .9,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Text>[
                              Text(
                                'HELLO ACOUSTIC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Text(
                                'What is your plan for today?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white),
                            ),
                            width: 35,
                            height: 35,
                            child:
                                Image.asset('assets/default/default_user.png'),
                          )
                        ],
                      ),
                    ),
                    //ACTIVITIES
                    Container(
                      width: mediaWidth,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Activity(
                            level: '10',
                            line1: 'Songs',
                            line2: 'Learn',
                            icons: FontAwesomeIcons.guitar,
                            color: Palette.green,
                          ),
                          Activity(
                            level: '10',
                            line1: 'Quiz',
                            line2: '/10',
                            icons: FontAwesomeIcons.question,
                            color: Palette.sky,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          //SECTION TITLE
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Guitar Workout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                FlatButton(
                  onPressed: () {},
                  highlightColor: Palette.icon,
                  splashColor: Palette.icon,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Palette.appbar,
                  child: Text(
                    'SEE ALL',
                    style: TextStyle(color: Palette.sky, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          //CATEGORY
          SizedBox(height: 5),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _sliderController,
              itemCount: category.length,
              onPageChanged: (index) {
                setState(() {
                  _currentCateIndex = index;
                });
              },
              itemBuilder: (context, index) {
                CategoryCard card = category[index];
                return AnimatedBuilder(
                    animation: _sliderController,
                    builder: (context, child) {
                      double value = 1.0;
                      //if dimesions is not establish => no controller page value
                      if (_sliderController.position.haveDimensions) {
                        value = _sliderController.page - index;
                      } else {
                        value = _currentCateIndex.roundToDouble() - index;
                      }
                      value = (1 - (value.abs() * .2)).clamp(0.0, 1.0);

                      return Transform.scale(
                        scale: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/${card.image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: Palette.greenblue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: index == 1 ? 0 : 5,
                                      top: 20,
                                      bottom: 20,
                                      right: index == 1 ? 40 : 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${card.title}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '${card.describe}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Completion',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Palette.appbar50,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 16,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: '${card.complete}',
                                                      style: TextStyle(
                                                        color: Palette.sky,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '/${card.total} Rounds',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _indicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _indicator() {
    List<Widget> _indicator = [];
    for (int i = 0; i < category.length; i++) {
      _indicator.add(Container(
        width: 10.0,
        height: 10.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentCateIndex == i ? Colors.blueAccent : Colors.grey,
        ),
      ));
    }
    return _indicator;
  }
}
