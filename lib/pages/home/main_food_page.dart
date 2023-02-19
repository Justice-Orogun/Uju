import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uju/pages/home/food_page_body.dart';
import 'package:uju/utils/colors.dart';
import 'package:uju/utils/dimensions.dart';
import 'package:uju/widgets/big_text.dart';
import 'package:uju/widgets/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " +MediaQuery.of(context).size.height.toString()); 
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(

            child: Container( 
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Nigeria", color: AppColors.mainColor),
                    Row ( 
                      children: [
                         SmallText(text: "Isiokolo", color: Colors.black54,),
                         Icon(Icons.arrow_drop_down_rounded)
                      ],
                     )
                  ],
                ),
                Center(
                  child:Container(
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSize24,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                ),
                )
              ],
            ),
          )
          ),
       //showing the body
        Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
            )), 
        ],
      ),
    );
  }
}



