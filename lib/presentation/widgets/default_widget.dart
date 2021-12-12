import 'package:flutter/material.dart';
import 'package:flutter_prayer/constants/colors.dart';

class DefaultWidget{
  static Widget defaultSeparate(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: MyColors.blueColor,
      height: 1,
    );
  }
  static Widget defaultCircularProgressIndicator(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}