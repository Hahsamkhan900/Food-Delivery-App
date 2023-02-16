import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_colomn.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initQuantity(Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstant.Base_URL+AppConstant.UPLOAD_URL+product.img!)
                )
              ),


          ),
          ),
          // Icons Widget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                onTap: ()=>{
                  //Navigation for next page
                  Get.toNamed(RouteHelper.getInitial())
                },
                  child: AppIcons(icon: Icons.arrow_back_ios),
                ),
                GestureDetector(
                    onTap: ()=>{
                      //Navigation for next page
                      Get.toNamed(RouteHelper.getInitial())
                    },
                    child: AppIcons(icon: Icons.shopping_cart_outlined))

              ],



            ),
          ),
          // Introduction about the food
          Positioned(
            left: 0,
            right: 0,
            top: Dimension.popularFoodImgSize-20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, top: Dimension.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimension.radius20), topLeft: Radius.circular(Dimension.radius20)),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColomn(text: product.name!),
                  SizedBox(height: Dimension.height10),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimension.height10),
              Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: (product.description!)
                          )
                      ),
                  ),

                ],
              ),

            ),
          ),


        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimension.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimension.height30, bottom: Dimension.height30, left: Dimension.width20, right: Dimension.width20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimension.radius20*2), topRight:Radius.circular(Dimension.radius20*2)),
              color: AppColors.buttonBackgroundColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: Dimension.width20, top: Dimension.height20, right: Dimension.width20, bottom: Dimension.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      } ,
                      child: Icon(Icons.remove, color: AppColors.signColor, size: Dimension.iconSize24,),
                    ),
                    SizedBox(width: Dimension.width05,),
                    BigText(text: popularProduct.quantity.toString(), size: Dimension.font20, color: AppColors.textColor,),
                    SizedBox(width: Dimension.width05,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor, size: Dimension.iconSize24,),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Dimension.width10,),
              Container(
                padding: EdgeInsets.only(left: Dimension.width20, top: Dimension.height20, right: Dimension.width20, bottom: Dimension.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor
                ),
                child: Container(
                  child: GestureDetector(
                    onTap: (){
                      popularProduct.addItem(product);
                    },
                      child: BigText(text: "\$ ${product.price!}"+" | Add to Cart", color: Colors.white, size: Dimension.font16,)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
