import 'package:get/get_core/src/get_main.dart'; 
import 'package:uju/data/api/api_client.dart'; 
import 'package:get/get.dart'; 
import 'package:uju/data/api/api_client.dart';
import 'package:uju/pages/food/popular_food_detail.dart';
import 'package:uju/data/repository/popular_product_repo.dart'; 
import 'package:uju/controllers/popular_product_controller.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(() =>ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));

  //repo
  Get.lazyPut(() =>PopularProductRepo(apiClient:Get.find()));
  
//controllers
  Get.lazyPut(() =>PopularProductController(popularProductRepo:Get.find()));
  
}