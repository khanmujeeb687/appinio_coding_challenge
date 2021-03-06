import 'dart:ui';

import 'package:appinio_coding_challenge/models/weather_info.dart';
import 'package:appinio_coding_challenge/values/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/forcast_item.dart';
import '../../utils/screen_utils.dart';
import '../../values/CustomColors.dart';

class DetailsScreen extends StatefulWidget {
  WeatherInfo weatherInfo;

  DetailsScreen(this.weatherInfo, {Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getHeight(context);
    double screenWidth = ScreenUtils.getWidth(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: Border.all(color: Colors.transparent),
      ),
      child: Center(
        child: Hero(
          tag: "city",
          child: ClipRRect(
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: screenHeight,
              width: screenWidth,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    CustomColors.blue,
                    CustomColors.purple,
                    CustomColors.purple
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.network(
                      ApiConstants.HTTP +
                          (widget.weatherInfo.current?.condition?.icon ?? ""),
                      height: screenWidth / 4,
                      width: screenWidth / 4,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.weatherInfo.current?.tempC} \u2103",
                          style: const TextStyle(
                              fontFeatures: [
                                FontFeature.subscripts(),
                              ],
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 50),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: BoxDecoration(
                                color: CustomColors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Feels like ${widget.weatherInfo.current?.feelslikeC} \u2103",
                              style: const TextStyle(
                                  fontFeatures: [
                                    FontFeature.subscripts(),
                                  ],
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.weatherInfo.location?.region ?? "",
                      style: const TextStyle(
                          color: CupertinoColors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                            color: CustomColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: Text(
                            (widget.weatherInfo.current?.cloud.toString() ??
                                    "") +
                                "% Cloudy",
                            style: const TextStyle(color: CustomColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _item(
                      "Humidity ${widget.weatherInfo.current?.humidity}%",
                      CupertinoIcons.cloud_rain,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _item("UV ${widget.weatherInfo.current?.uv}",
                        CupertinoIcons.waveform_path_ecg),
                    SizedBox(
                      height: 20,
                    ),
                    _item("Vision ${widget.weatherInfo.current?.visKm} Km",
                        CupertinoIcons.eye_solid),
                    SizedBox(
                      height: 20,
                    ),
                    _item(
                        "Wind Speed ${widget.weatherInfo.current?.windKph} Kph towards ${widget.weatherInfo.current?.windDir}",
                        CupertinoIcons.wind),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 20,bottom: 15,top: 20),
                            child: Text("Weather Forecast",style: TextStyle(color: CustomColors.white,fontSize: 25),))),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: screenWidth - 40,
                        padding: EdgeInsets.only(top: 20,bottom: 60),
                        decoration: BoxDecoration(
                            color: CustomColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(widget.weatherInfo.forecast?.forecastday?.first.hour?.length ?? 0, (index) => ForecastItem(widget.weatherInfo.forecast?.forecastday?.first.hour![index])),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(String title, IconData icon) {
    double screenWidth = ScreenUtils.getWidth(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: screenWidth - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: CustomColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: CustomColors.white, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
