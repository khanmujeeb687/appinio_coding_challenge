import 'package:appinio_coding_challenge/tabs/cv_tab.dart';
import 'package:flutter/cupertino.dart';

import '../tabs/city_info_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cloud_moon_fill),
            label: 'City',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
            label: 'CV',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch(index){
          case 0:
            return CityInfoTab();
          case 1:
            return CVTab();
          default:
            return SizedBox();
        }
      },
    );
  }
}
