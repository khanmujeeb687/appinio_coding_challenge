import 'package:appinio_coding_challenge/screens/home_screen.dart';
import 'package:appinio_coding_challenge/values/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_NAME,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.black,
        primaryColor: Color(0xff432c85)
      ),
      home: HomeScreen(),
    );
  }
}
