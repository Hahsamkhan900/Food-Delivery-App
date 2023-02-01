import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimension.dart';

class AppIcons extends StatelessWidget {

  final IconData icon;
  final Color bgColor;
  final Color iconColor ;
  final double Size;
  final double? iconSize;

  const AppIcons({Key? key, required this.icon, this.bgColor= const Color(0xFFfcf4e4), this.iconColor = const Color(0xFF756d54), this.Size= 40, this.iconSize= 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size,
      height: Size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Size/2),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
