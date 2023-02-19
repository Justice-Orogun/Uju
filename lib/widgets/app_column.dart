import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:uju/utils/dimensions.dart';
import 'package:uju/widgets/big_text.dart';
import 'package:uju/widgets/small_text.dart';
import 'package:uju/widgets/icon_and_text_widget.dart';
import 'package:uju/utils/colors.dart'; 
import 'package:uju/widgets/app_icon.dart';
import 'package:uju/widgets/app_column.dart';

class AppColumn extends StatelessWidget {
  final String text; 

  const AppColumn ({Key? key, required this.text}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: text, size: Dimensions.font26,), 
                  SizedBox(height: Dimensions.height10,), 
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {return Icon(Icons.star, color: AppColors.mainColor, size: 15,);}),
                      ), 
                      SizedBox(width: 10,), 
                      SmallText(text: "4.5"), 
                      SizedBox(width: 10,), 
                      SmallText(text: "1208"), 
                      SizedBox(width: 10,), 
                      SmallText(text: "Comments")
                    ],
                  ),
                SizedBox(height: Dimensions.height20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconAndTextWidget(icon: Icons.circle_sharp, 
                    text: "Normal", 
                    iconColor: AppColors.iconColor1), 

                    IconAndTextWidget(icon: Icons.location_on, 
                    text: "1.7km", 
                    iconColor: AppColors.mainColor), 

                    IconAndTextWidget(icon: Icons.access_time_rounded, 
                    text: "30min", 
                    iconColor: AppColors.iconColor2)
                  ],
                )
                ],
              );
  }
}