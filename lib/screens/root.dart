import 'package:imacoustic/config/palette.dart';
import 'package:imacoustic/screens/homepage.dart';
import 'package:imacoustic/screens/search.dart';
import 'package:imacoustic/widget/bottomNavigationItem.dart';
import 'package:preload_page_view/preload_page_view.dart';

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
      child: Scaffold(
        body: PreloadPageView(
          physics: const NeverScrollableScrollPhysics(),
          preloadPagesCount: 5,
          controller: _pageController,
          children: [
            Center(child: Text('0')),
            SearchScreen(),
            HomeScreen(),
            Center(child: Text('3')),
            Center(child: Text('4')),
          ],
          onPageChanged: (index) {
            setState(() => active = index);
          },
        ),
        bottomNavigationBar: Container(
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
                    onPressed: () => _pageController.jumpToPage(0),
                    name: 'Custom',
                    icon: FontAwesomeIcons.plusCircle,
                    index: 0,
                    active: active,
                  ),
                  BottomNavigationItem(
                    onPressed: () => _pageController.jumpToPage(1),
                    name: 'Explore',
                    icon: FontAwesomeIcons.search,
                    index: 1,
                    active: active,
                  ),
                  BottomNavigationItem(
                    onPressed: () => _pageController.jumpToPage(2),
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
                    onPressed: () => _pageController.jumpToPage(3),
                    name: 'Saved',
                    icon: FontAwesomeIcons.book,
                    index: 3,
                    active: active,
                  ),
                  BottomNavigationItem(
                    onPressed: () => _pageController.jumpToPage(4),
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
    );
  }
}
