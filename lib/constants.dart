import 'package:flutter/material.dart';


const int emergencyPhoneNo = 2347034811040;


const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const tiffanyBlue = Color(0xff558b2f);

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
var kOrangeColor = Color(0xffEF716B);
var kBlueColor = Color(0xff4B7FFB);
var kYellowColor = Color(0xffFFB167);
var kTitleTextColor = Color(0xff1E1C61);
var kSearchBackgroundColor = Color(0xffF2F2F2);
var kSearchTextColor = Color(0xffC0C0C0);
var kCategoryTextColor = Color(0xff292685);
const backgroundColor = Color(0xFFFEFEFE);
const titleTextColor = Color(0xFF303030);
const bodyTextColor = Color(0xFF4B4B4B);
const textLightColor = Color(0xFF959595);
const infectedColor = Color(0xFFFF8748);
const deathColor = Color(0xFFFF4848);
const recoverColor = Color(0xFF36C12C);
const primaryColor = Color(0xFF3382CC);
final shadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final activeShadowColor = Color(0xFF4056C6).withOpacity(.15);

const green = Color(0xff61BD80);
final transparentBlack = Colors.black.withOpacity(0.07);

const headerTextStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

const subTextStyle = TextStyle(fontSize: 16, color: textLightColor);

const textTextStyle =
TextStyle(fontSize: 18, color: titleTextColor, fontWeight: FontWeight.bold);

Icon showGrowthIcon(int currentData, int previousData) {
  Icon icon;
  if (currentData > previousData) {
    icon = Icon(
      Icons.arrow_upward,
      color: Colors.red,
    );
  } else {
    icon = Icon(
      Icons.arrow_downward,
      color: Colors.red,
    );
  }
  return icon;
}

calculateGrowthPercentage(int previousData, int newData) {
  var growthPercentage = (newData / previousData) * 100;
  return growthPercentage.isFinite || growthPercentage.isNaN
      ? 0.0
      : growthPercentage;
}

Color showGrowthColor(int currentData, int previousData) {
  Color color;
  if (currentData > previousData) {
    color = Colors.green;
  } else {
    color = Colors.red;
  }
  return color;
}

