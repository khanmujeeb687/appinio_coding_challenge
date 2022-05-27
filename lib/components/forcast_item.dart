import 'package:appinio_coding_challenge/values/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/weather_info.dart';

class ForecastItem extends StatefulWidget {
  Hour? hour;
  ForecastItem(this.hour,{Key? key}) : super(key: key);

  @override
  State<ForecastItem> createState() => _ForecastItemState();
}

class _ForecastItemState extends State<ForecastItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.hour?.time?.toString().split(" ")[1] ?? "",style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.w300,fontSize: 14),),
          SizedBox(height: 8,),
          Text("${widget.hour?.tempC} \u2103",style: TextStyle(color: CupertinoColors.systemGrey3,fontWeight: FontWeight.w300,fontSize: 14),),
          SizedBox(height: 5,),
          Image.network(ApiConstants.HTTP+(widget.hour?.condition?.icon ?? ""),height: 50,width: 50,),
          SizedBox(height: 3,),
          Text(widget.hour?.condition?.text ?? "",style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.w300,fontSize: 14),textAlign: TextAlign.center,),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.arrow_uturn_right_circle_fill),
              Text("${widget.hour?.windKph} kph",style: TextStyle(color: CupertinoColors.systemGrey5,fontWeight: FontWeight.bold,fontSize: 14),)
            ],
          )
        ],
      ),
    );
  }
}
