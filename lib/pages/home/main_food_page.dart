import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("The size of the Screen is"+ MediaQuery.of(context).size.height.toString());

    return Scaffold(
      body: Column(
        children: [
          // header of our app in which we have search button and Location
          Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimension.height45, bottom: Dimension.height15),
                padding: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Country Name and City Name section in Header
                    Column(
                      children: [
                        // Reusable Text Widget is used here
                        BigText(text: "Pakistan" , color: AppColors.mainColor, ),

                        Row(
                          children: [
                            SmallText(text: "Karachi", color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )

                      ],
                    ),
                    // Search Icon Container
                    Center(
                      child: Container(
                        width: Dimension.width45,
                        height: Dimension.height45,
                        child: Icon(Icons.search, color: Colors.white,size: Dimension.iconSize24,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.radius15),
                            color: AppColors.mainColor
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          // Showing the Body
          Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),

          ),
          ),
        ],
      ),
    );
  }
}
