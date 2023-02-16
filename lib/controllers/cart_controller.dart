import 'package:food_delivery/Models/cart_model.dart';
import 'package:food_delivery/Models/products_model.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItem(ProductModel product,int quantity){
    _items.putIfAbsent(product.id!, () {
      print("Items are added into Cart" + product.id!.toString() + "quantity " + quantity.toString());
      return CartModel(
          id: product.id,
          name:product.name,
          price:product.price,
          img:product.img,
          quantity:quantity,
          isExist: true,
          time:DateTime.now().toString()
      );
    });

  }

}