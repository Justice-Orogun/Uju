import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uju/utils/dimensions.dart';
import 'package:uju/widgets/app_column.dart';
import 'package:uju/widgets/app_icon.dart';
import 'package:uju/widgets/big_text.dart';
import 'package:uju/widgets/small_text.dart';
import 'package:uju/widgets/icon_and_text_widget.dart';
import 'package:uju/utils/colors.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite, 
              height: Dimensions.popularFoodImgSize, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/food1.jpeg")
                )

              ),

              )), 
            

            //icons widget for back and shopping cart
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20, 
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
            )), 
              //introduction 
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20), 
                  topLeft: Radius.circular(Dimensions.radius20)
                ), 
                color: Colors.white
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Owho Soup and Starch"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce")
                ],
              ),

            ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar, 
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2), 
            topRight: Radius.circular(Dimensions.radius20*2), 
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20), 
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,), 
                  SizedBox(width: Dimensions.width10/2,), 
                  BigText(text: "0"), 
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ), 
            Container(
               padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text:"\₦1000 | Add to cart", color:Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20), 
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}