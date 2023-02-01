import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColomn extends StatelessWidget {
  final String text;


  const AppColomn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimension.font26),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.stars,
                  color: AppColors.mainColor,
                  size: Dimension.height15,
                ),
              ),
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: " Comments")
          ],
        ),
        SizedBox(
          height: Dimension.height10,
        ),
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
        )
      ],
    );
  }
}
