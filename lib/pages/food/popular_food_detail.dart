import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_colomn.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage("assets/images/food0.png")
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
              children: const [
                AppIcons(icon: Icons.arrow_back_ios),
                AppIcons(icon: Icons.shopping_cart_outlined)

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
                  AppColomn(text: "Chinese Side"),
                  SizedBox(height: Dimension.height10),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimension.height10),
                  const Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: "Many historians believe that biryani originated from Persia and was brought to India by the Mughals. Biryani was further developed in the Mughal royal kitchen. the Mughal soldiers looked undernourished. In order to provide a balanced diet to the soldiers, she asked the chefs to prepare dish with meat and rice.")
                      ),
                  ),

                ],
              ),

            ),
          ),


        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor, size: Dimension.iconSize16,),
                  SizedBox(width: Dimension.width05,),
                  BigText(text: "0", size: Dimension.font16, color: AppColors.textColor,),
                  SizedBox(width: Dimension.width05,),
                  Icon(Icons.add, color: AppColors.signColor, size: Dimension.iconSize16,)
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
                child: BigText(text: "\$10 | Add to Cart", color: Colors.white, size: Dimension.font16,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
