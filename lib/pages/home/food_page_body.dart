import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uju/utils/colors.dart';
import 'package:uju/utils/dimensions.dart';
import 'package:uju/widgets/app_column.dart';
import 'package:uju/widgets/big_text.dart';
import 'package:uju/widgets/icon_and_text_widget.dart';
import 'package:uju/widgets/small_text.dart'; 
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/src/widgets/basic.dart'; 
import 'package:uju/widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController= PageController(viewportFraction: 0.85);
  var _currPageValue=0.0; 
  double _scaleFactor=0.8; 
  double _height=Dimensions.pageViewContainer;

   @override
   void initState() {
     super.initState();
     pageController.addListener(() {
       setState(() {
         _currPageValue = pageController.page!; 
         print("current value is " +_currPageValue.toString()); 
       });
     });
   }

    @override
    void dispose(){ 
      pageController.dispose(); 
      }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section 
        Container(
      // color: Colors.redAccent,
      height: Dimensions.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5, 
        itemBuilder: (context, position){ 
        return _buildPageItem(position); 
      }),
    ), 
          //the dots
        new DotsIndicator(
      dotsCount: 5,
      position: _currPageValue,
      decorator: DotsDecorator(
        color: Color.fromARGB(221, 58, 55, 55), // Inactive color
        activeColor: AppColors.mainColor,
      ),
    ),
    
          //Popular text 
          SizedBox(height: Dimensions.height30,), 
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Our Popular Foods"), 
                SizedBox(width: Dimensions.width10,), 
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26,),
                ),
                SizedBox(width: Dimensions.width10,), 
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing",),
                )

              ],
            ),
          ),
      
             ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  //images and their roles
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20), 
                      color: Colors.white38, 
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/food5.jpg"
                        ) )
                    ),
                  ), 

                  //text containers 
                Expanded( 
                  child: Container(
                    height: Dimensions.listViewTextContSize, 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20), 
                        bottomRight: Radius.circular(Dimensions.radius20), 
                      ), 
                      color: Colors.white, 
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: "Nutritious Cow Legs Just For You"), 
                          SizedBox(height: Dimensions.height10,), 
                          SmallText(text: "With very spicy pepper soup"), 
                          SizedBox(height: Dimensions.height10,), 
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
                      ),
                    ),
                  ),
                  
                )
                ],
              ),
            );
            
          }
          ),
        
            //list of our popular foods and images    
      ],
    );
  }
  Widget _buildPageItem(int index){ 
    Matrix4 matrix = new Matrix4.identity(); 
    if(index == _currPageValue.floor()){ 
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);

      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; 
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
       matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      
    }else if(index == _currPageValue.floor()-1){
       var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);  var currTrans = _height*(1-currScale)/2; 
       matrix = Matrix4.diagonal3Values(1, currScale, 1);
       matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{ 
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 1);

    }

      return Transform( 
        transform: matrix,
        child:Stack(
      children: [
        Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(left:Dimensions.width10, right:Dimensions.width10),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30), 
        color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc), 
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/food1.jpeg"
            )
         )
        ),
       ),
    Align( 
      alignment: Alignment.bottomCenter,
      child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left:Dimensions.width30, right:Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20), 
              color: Colors.white,  
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8), 
                  blurRadius: 5.0, 
                  offset: Offset(0,5)
                ), 
                BoxShadow(
                  color: Colors.white, 
                  offset: Offset(-5, 0)
                ),
                BoxShadow(
                  color: Colors.white, 
                  offset: Offset(5, 0)
                ),
              ]
           
            ),
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
              child: AppColumn(text: "Owho Soup and Starch"), 
            ),
            
          )
    )

      ],
    ),
      );
  }
}