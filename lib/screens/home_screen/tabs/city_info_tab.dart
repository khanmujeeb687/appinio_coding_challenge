import 'dart:ui';

import 'package:appinio_coding_challenge/models/weather_info.dart';
import 'package:appinio_coding_challenge/utils/screen_utils.dart';
import 'package:appinio_coding_challenge/values/CustomColors.dart';
import 'package:appinio_coding_challenge/values/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../detail_screen/detail_screen.dart';

class CityInfoTab extends StatefulWidget {
  WeatherInfo? weatherInfo;
  CityInfoTab(this.weatherInfo,{Key? key}) : super(key: key);

  @override
  State<CityInfoTab> createState() => _CityInfoTabState();
}

class _CityInfoTabState extends State<CityInfoTab> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getHeight(context);
    double screenWidth = ScreenUtils.getWidth(context);
    return Center(
      child: GestureDetector(
        onTap: onClick,
        child: Hero(
          tag: "city",
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
                  if(widget.weatherInfo!=null)
                    Image.network(ApiConstants.HTTP+(widget.weatherInfo?.current?.condition?.icon ?? ""),height: screenWidth/4,width: screenWidth/4,),
                  const SizedBox(height: 50,),
                  Text("${widget.weatherInfo?.current?.tempC  ?? "--"} \u2103",style: const TextStyle(
                      fontFeatures: [
                        FontFeature.subscripts(),
                      ],
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 50
                  ),),
                  const SizedBox(height: 30,),
                  Text(widget.weatherInfo==null?"":(widget.weatherInfo?.location?.region?.toUpperCase() ?? ""),style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClick() async{
    if(widget.weatherInfo==null) return;
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return DetailsScreen(widget.weatherInfo!);
    }));
  }
}
