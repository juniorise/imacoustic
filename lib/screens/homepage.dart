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
  List<CategoryCard> category = [
    CategoryCard(
      'FINGERSTYLE',
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
  Widget build(BuildContext context) {
    double headerRadius = 20;
    double mediaWidth = MediaQuery.of(context).size.width;
    //double mediaHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //HEADER
        Container(
          height: 190,
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
                    color: Palette.appbar65,
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
                          child: Image.asset('assets/default/default_user.png'),
                        )
                      ],
                    ),
                  ),
                  //ACTIVITIES
                  Container(
                    width: mediaWidth,
                    height: 100,
                    child: Column(
                      children: [
                        Row(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Activity(
                              level: '10',
                              line1: 'Custom',
                              line2: 'Create',
                              icons: FontAwesomeIcons.guitar,
                              color: Palette.yellow,
                            ),
                            Activity(
                              level: '10',
                              line1: 'Loved',
                              line2: 'from learner',
                              icons: FontAwesomeIcons.guitar,
                              color: Palette.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        //SECTION TITLE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Guitar Workout',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            FlatButton(
              onPressed: () {},
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
        //CATEGORY
        SizedBox(height: 5),
        Container(
          height: 380,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              CategoryCard card = category[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 270,
                margin: EdgeInsets.only(
                    left: 20, right: index == category.length - 1 ? 20 : 0),
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
                          padding: const EdgeInsets.only(
                            left: 5,
                            top: 20,
                            bottom: 20,
                            right: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      borderRadius: BorderRadius.circular(5),
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
                                            text: '/${card.total} Rounds',
                                            style:
                                                TextStyle(color: Colors.white),
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
              );
            },
          ),
        )
      ],
    );
  }
}
