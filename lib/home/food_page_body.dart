import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPage = 0.0;
  double _scaleFactor = 0.8;
  double _height=220;

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

  @override
  void dispose(){
    pageController.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPage.floor()){
      var currScale = 1 - (_currPage-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,_currPage,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPage.floor()+1){
      var currScale = _scaleFactor+(_currPage-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,_currPage,1);
      matrix = Matrix4.diagonal3Values(1,_currPage,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPage.floor()-1){
      var currScale = 1 - (_currPage-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,_currPage,1);
      matrix = Matrix4.diagonal3Values(1,_currPage,1)..setTranslationRaw(0, currTrans, 0);
    }



    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food0.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Slide"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.stars,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1287"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: " Comments")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
