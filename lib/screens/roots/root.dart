import 'package:flutter/services.dart';
import 'package:imacoustic/config/notifier.dart';
import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/screens/roots/savedscreen.dart';
import 'package:imacoustic/screens/roots/customcreate.dart';
import 'package:imacoustic/screens/roots/homepage.dart';
import 'package:imacoustic/screens/roots/profilescreen.dart';
import 'package:imacoustic/screens/roots/search.dart';
import 'package:imacoustic/widget/bottomNavigationItem.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int active = 2;
  PreloadPageController _pageController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    _pageController = PreloadPageController(
      initialPage: active,
      keepPage: true,
      viewportFraction: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (e) => PageOffsetNotifier(_pageController),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: [
              PreloadPageView(
                physics: const BouncingScrollPhysics(),
                preloadPagesCount: 5,
                controller: _pageController,
                children: [
                  CustomCreateScreen(),
                  SearchScreen(),
                  HomeScreen(),
                  SavedScreen(),
                  ProfileScreen(),
                ],
                onPageChanged: (index) {
                  setState(() => active = index);
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BottomAppBar(
                      color: Palette.appbar,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BottomNavigationItem(
                            onPressed: () => animateToPage(0, active),
                            name: 'Custom',
                            icon: FontAwesomeIcons.plusCircle,
                            index: 0,
                            active: active,
                          ),
                          BottomNavigationItem(
                            onPressed: () => animateToPage(1, active),
                            name: 'Explore',
                            icon: FontAwesomeIcons.search,
                            index: 1,
                            active: active,
                          ),
                          BottomNavigationItem(
                            onPressed: () => animateToPage(2, active),
                            name: 'Home',
                            icon: null,
                            index: 2,
                            active: active,
                            image: Image.asset(
                              active == 2
                                  ? 'assets/images/imacoustic-logo.png'
                                  : 'assets/images/imacoustic-logonactive.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                          BottomNavigationItem(
                            onPressed: () => animateToPage(3, active),
                            name: 'Saved',
                            icon: FontAwesomeIcons.book,
                            index: 3,
                            active: active,
                          ),
                          BottomNavigationItem(
                            onPressed: () => animateToPage(4, active),
                            name: 'Profile',
                            icon: FontAwesomeIcons.userAstronaut,
                            index: 4,
                            active: active,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animateToPage(des, source) {
    //(Des, Source)
    // var duration = 250;
    // int index;
    _pageController.jumpToPage(des);
    // if (source - des > 1 || des - source > 1) {
    //   if (source > des) index = des + 2;
    //   if (des > source) index = des;
    //   if (source - des == 2 || des - source == 2) {
    //     _pageController.animateToPage(
    //       index - 1,
    //       curve: Curves.easeIn,
    //       duration: Duration(milliseconds: duration),
    //     );
    //     _pageController.animateToPage(
    //       des,
    //       curve: Curves.easeIn,
    //       duration: Duration(milliseconds: duration + 50),
    //     );
    //   } else {
    //     _pageController.jumpToPage(index - 1);
    //     _pageController.animateToPage(
    //       des,
    //       curve: Curves.easeIn,
    //       duration: Duration(milliseconds: duration + 50),
    //     );
    //   }
    // } else {
    //   _pageController.animateToPage(
    //     des,
    //     curve: Curves.easeIn,
    //     duration: Duration(milliseconds: duration),
    //   );
    // }
  }
}
