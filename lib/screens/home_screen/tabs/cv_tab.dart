import 'package:appinio_coding_challenge/values/CustomColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/screen_utils.dart';

class CVTab extends StatefulWidget {
  const CVTab({Key? key}) : super(key: key);

  @override
  State<CVTab> createState() => _CVTabState();
}

class _CVTabState extends State<CVTab> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getHeight(context);
    double screenWidth = ScreenUtils.getWidth(context);
    return Container(
      color: CustomColors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
           Container(
            height: screenHeight * 1 / 2,
            width: screenWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: screenHeight / 3,
                    color: CustomColors.black,
                    width: screenWidth,
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth / 4,
                        backgroundImage: const AssetImage(
                            "assets/images/passport_size_pic.jpeg"),
                      ),
                    ],
                  ),
                  bottom: screenWidth / 8,
                  right: null,
                  left: null,
                )
              ],
            ),
          ),
          Container(
            height: (screenHeight * 1 / 2) - 50,
            color: CustomColors.white,
            margin: EdgeInsets.only(left: screenWidth/4),
            child: Column(
              children: [
                Row(
                  children:const  [
                     Text("My Contact",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: screenWidth / 2,
                        child: const Divider(
                          thickness: 2,
                          color: CustomColors.black,
                        )),
                  ],
                ),
                const SizedBox(height: 10,),
                _item(CupertinoIcons.mail_solid, "khanmujeeb687@gmail.com"),
                const SizedBox(height: 10,),
                _item(CupertinoIcons.phone_circle, "+49 015143402186"),
                const SizedBox(height: 10,),
                _item(CupertinoIcons.location_solid, "Wilhelm Raabe Strasse - 26,\nKaiserslautern, Germany, 67663"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _item(IconData iconData, String title){
    return Row(
      children: [
        Icon(iconData,color: CustomColors.black,),
        const SizedBox(width: 5,),
        Text(title)
      ],
    );
  }
}
