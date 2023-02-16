import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // it helps to off automated back button
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  // Routing for Main Page
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcons(
                    icon: Icons.clear,
                  ),
                ),
                GestureDetector(
                  // Routing on Cart System
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcons(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimension.height20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimension.height05, bottom: Dimension.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius30),
                      topRight: Radius.circular(Dimension.radius30)),
                  color: Colors.white,
                ),
                child: Center(
                    child: BigText(
                  text: product.name!,
                  size: Dimension.font26,
                ),
                ),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstant.Base_URL+AppConstant.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Don't open hi Bhut bara text hay andar
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: Dimension.width30),
                  child: ExpandableTextWidget(
                    text: (product.description!),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimension.width25*2, right:Dimension.width25*2 ,top: Dimension.height20, bottom: Dimension.height20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(icon: Icons.remove, bgColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimension.iconSize24),
                BigText(text: "\$ ${product.price!} X  0",size: Dimension.font26,color: AppColors.mainBlackColor,),
                AppIcons(icon: Icons.add, bgColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimension.iconSize24),
              ],
            ),
          ),
          Container(
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
                  margin: EdgeInsets.only(left: Dimension.width20),
                  padding: EdgeInsets.only(left: Dimension.width20, top: Dimension.height20, right: Dimension.width20, bottom: Dimension.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: AppColors.mainColor, size: Dimension.iconSize24,),
                    ],
                  ),
                ),
                SizedBox(width: Dimension.width10,),
                Container(
                  margin: EdgeInsets.only(right: Dimension.width20),
                  padding: EdgeInsets.only(left: Dimension.width20, top: Dimension.height20, right: Dimension.width20, bottom: Dimension.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor
                  ),
                  child: Container(
                    child: BigText(text: "\$ ${product.price!} | Add to Cart", color: Colors.white, size: Dimension.font16,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
