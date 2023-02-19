import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uju/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color; 
  final String text; 
  final double size; 
  final TextOverflow overflow; 

  BigText({  Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size =0, 
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text( 
      text, 
      maxLines: 1,
      overflow: overflow, 
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color, 
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400
      ),

    );
  }
}