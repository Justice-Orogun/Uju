import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uju/utils/dimensions.dart';
import 'package:uju/widgets/app_icon.dart'; 

class AppIcon extends StatelessWidget {
  final IconData icon; 
  final Color backgroundColor; 
  final Color iconColor; 
  final double size; 
  final double iconSize; 
  
   AppIcon({Key? key, 
  required this.icon, 
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor =const Color(0xFF756d54), 
    this.size=40,
    this.iconSize=16 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: size,
      height: size, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2), 
        color: backgroundColor
      ),
      child: Icon(
        icon, 
        color: iconColor, 
        size: iconSize,
      ),
    );
  }
}