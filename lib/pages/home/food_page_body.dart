import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../utils/dimension.dart';
import '../../widgets/app_colomn.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // Apply Page controller here for animation of Banner Slider
  PageController pageController = PageController(viewportFraction: 0.85);

  // Getting The Current Page Values for Matrix4
  var _currPage = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.PageViewContainer;

  // Apply a initState filter for getting the values of page view which will be used in Matrix4
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPage = pageController.page!;
        // print("Current Page value is " + _currPage.toString());
      });
    });
  }

  //Disposing of pageController
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slide Section
        SizedBox(
          // color: Colors.red,
          height: Dimension.PageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // Dots Indicator
        DotsIndicator(
          dotsCount: 5,
          position: _currPage,
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.radius10))),
        ),
        SizedBox(
          height: Dimension.height30,
        ),
        // Popular Text
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular", size: Dimension.font20),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3.0),
                child: BigText(
                  text: '.',
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                child: SmallText(text: 'Food Pairing'),
              )
            ],
          ),
        ),
        SizedBox(
          height: Dimension.height30,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, bottom: Dimension.height10),
                  child: Row(
                    children: [
                      // image Section
                      Container(
                        width:Dimension.listViewImgSize,
                        height: Dimension.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimension.radius20),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food0.png")
                          )
                        ),
                      ),
                      // Text Section
                      Expanded(
                        child:Container(
                        height: Dimension.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.radius20),
                            bottomRight: Radius.circular(Dimension.radius20),
                          ),
                          color: Colors.white,
                        ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutrition Fruit Meals made in China"),
                                SizedBox(height: Dimension.height10  ,),
                                SmallText(text: "With Chinese characters"),
                                SizedBox(height: Dimension.height10  ,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle,
                                        text: "Normal",
                                        iconColor: AppColors.yellowColor),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7 Km",
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32 min",
                                        iconColor: AppColors.iconColor2)
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ),

                      ),
                    ],
                  ),

                );
              }),

      ],
    );
  }

  // Here I am using Widget Property for Building A Slider with animation
  Widget _buildPageItem(int index) {
    // Matrix4 is used for transmission with the help of x and y value of the screen
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPage.floor()) {
      var currScale = 1 - (_currPage - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPage - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPage.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPage - index - 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    // Apply Transform which is used to get the matrix transition init
    return Transform(
      transform: matrix,

      // Stack is used for two container which will be placed on each other
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimension.width05, right: Dimension.width05),
            height: Dimension.PageViewContainer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food0.png"))),
          ),
          // Second Container Starting
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimension.height25,
                  right: Dimension.height25,
                  bottom: Dimension.height30),
              height: Dimension.PageViewTextContainer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.height15,
                    right: Dimension.height15,
                    top: Dimension.height15),
                child: AppColomn(text: "Chinese Side"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
