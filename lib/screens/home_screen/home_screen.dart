import 'package:appinio_coding_challenge/models/weather_info.dart';
import 'package:appinio_coding_challenge/screens/home_screen/tabs/city_info_tab.dart';
import 'package:appinio_coding_challenge/screens/home_screen/tabs/cv_tab.dart';
import 'package:appinio_coding_challenge/services/weather_service.dart';
import 'package:appinio_coding_challenge/values/CustomColors.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  WeatherInfo? _weatherInfo;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: CustomColors.white,
      tabBar: CupertinoTabBar(
        border: Border.all(color: CustomColors.white, width: 0),
        onTap: onTabChange,
        backgroundColor:
            _currentTab == 0 ? CustomColors.white : CustomColors.white,
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
        switch (index) {
          case 0:
            return CityInfoTab(_weatherInfo);
          case 1:
            return const CVTab();
          default:
            return const SizedBox();
        }
      },
    );
  }

  void onTabChange(int value) {
    setState(() {
      _currentTab = value;
    });
  }

  void fetch() async {
    _weatherInfo = await WeatherService.getWeatherInfo();
    setState(() {});
  }
}
