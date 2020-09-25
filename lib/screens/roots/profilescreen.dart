import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/data/exericses.dart';
import 'package:imacoustic/widget/activity.dart';
import 'package:imacoustic/widget/exercisecard.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //double mediaHeight = MediaQuery.of(context).size.height;
    double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 4.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/imacoustic_I.png',
              fit: BoxFit.fitWidth,
              width: 45,
            ),
            Text(
              ' Acoustic',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        bottom: PreferredSize(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: mediaWidth,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Palette.white10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Palette.red,
                        border: Border.all(color: Palette.sky, width: 5),
                      ),
                      width: 78,
                      height: 78,
                      child: Image.asset(
                        'assets/default/default_user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thea Choem',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Guitarist at NIPTICT',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
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
          preferredSize: Size(mediaWidth, 190),
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.share),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: mediaWidth,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  '20 August 2020',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              for (int i = 0; i < exercises.length; i++)
                ExerciseCard(i: i, exercises: exercises),
            ],
          );
        },
      ),
    );
  }
}
