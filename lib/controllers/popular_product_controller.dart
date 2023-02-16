import 'package:flutter/material.dart';
import 'package:food_delivery/Models/products_model.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  late CartController _cart;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get  quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;



  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      // print("got Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      // print(_popularProductList);
      update();
    }
    else{
      print("No Products Found");
      // popularProductList();
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      // print("Increament");

      _quantity = checkQuantity(_quantity + 1);
    }
    else{
      _quantity = checkQuantity(_quantity -1);
    }
    update();
  }

  checkQuantity(int quantity){
    if(quantity < 0){
      Get.snackbar("Item Count", "You can't reduce more !",colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return  0;
    }
    else if(quantity>20){

      Get.snackbar("Item Count", "You can't add more !",colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return 20;
    }
    else{
      return quantity;
    }

  }

  void initQuantity(CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product){
    _cart.addItem(product, _quantity);

  }



}