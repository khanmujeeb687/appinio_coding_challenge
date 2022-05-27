import 'dart:convert';

import 'package:appinio_coding_challenge/models/weather_info.dart';
import 'package:appinio_coding_challenge/values/constants/api_constants.dart';
import 'package:http/http.dart';

class WeatherService{

  static Future<WeatherInfo?> getWeatherInfo() async{
    try{
      String? lat = "49.444698";
      String? long = "7.769000";
      Response response = await get(Uri.parse(ApiConstants.WEATHER+lat+","+long));
      if(response.statusCode==200){
        var data = json.decode(response.body);
        return WeatherInfo.fromJson(data);
      }
    }catch(e){
      print(e.toString());
    }
  }
}