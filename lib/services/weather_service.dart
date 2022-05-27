import 'dart:convert';

import 'package:appinio_coding_challenge/models/weather_info.dart';
import 'package:appinio_coding_challenge/values/constants/api_constants.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';

class WeatherService{

  static Future<WeatherInfo?> getWeatherInfo(LocationData _locationData) async{
    try{
      Response response = await get(Uri.parse(ApiConstants.WEATHER+_locationData.latitude.toString()+","+_locationData.longitude.toString()));
      if(response.statusCode==200){
        var data = json.decode(response.body);
        return WeatherInfo.fromJson(data);
      }
    }catch(e){
      print(e.toString());
    }
  }
}