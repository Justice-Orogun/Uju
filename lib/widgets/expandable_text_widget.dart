import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uju/utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {

  final String text; 
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf; 
  late String secondHalf; 

  bool hiddenText=true; 

  double textHeight = Dimensions.screenHeight/5.63; 

  
    @override
  Widget build(BuildContext context) {
    return Container();
  }
}