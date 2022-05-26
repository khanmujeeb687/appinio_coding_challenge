import 'dart:ui';
import 'package:appinio_coding_challenge/utils/screen_utils.dart';
import 'package:appinio_coding_challenge/values/CustomColors.dart';
import 'package:flutter/cupertino.dart';

class CityInfoTab extends StatefulWidget {
  const CityInfoTab({Key? key}) : super(key: key);

  @override
  State<CityInfoTab> createState() => _CityInfoTabState();
}

class _CityInfoTabState extends State<CityInfoTab> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getHeight(context);
    double screenWidth = ScreenUtils.getWidth(context);
    return Center(
      child: ClipRRect(
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: screenHeight*.6,
          width: screenWidth*.8,
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            gradient: const LinearGradient(
              colors: [CustomColors.blue,CustomColors.purple,CustomColors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              Image.asset("assets/images/sun.png",height: screenWidth/4,width: screenWidth/4,),
              const SizedBox(height: 80,),
              const Text("10 \u2103",style: TextStyle(
                  fontFeatures: [
                    FontFeature.subscripts(),
                  ],
                color: CupertinoColors.white,
                fontWeight: FontWeight.w300,
                fontSize: 50
              ),),
              const SizedBox(height: 30,),
              const Text("KAISERSLAUTERN",style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
