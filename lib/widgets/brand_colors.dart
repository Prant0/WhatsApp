import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//firebase
    var firebaseAuth=FirebaseAuth.instance;
    var firebaseStore=FirebaseStorage.instance;
    var firestore=FirebaseFirestore.instance;

//controller



const backgroundColor = Color.fromRGBO(19, 28, 33, 1);
const textColor = Color.fromRGBO(241, 241, 242, 1);
const appBarColor = Color.fromRGBO(31, 44, 52, 1);
const webAppBarColor = Color.fromRGBO(42, 47, 50, 1);
const messageColor = Color.fromRGBO(5, 96, 98, 1);
const senderMessageColor = Color.fromRGBO(37, 45, 49, 1);
const tabColor = Color.fromRGBO(0, 167, 131, 1);
const searchBarColor = Color.fromRGBO(50, 55, 57, 1);
const dividerColor = Color.fromRGBO(37, 45, 50, 1);
const chatBarMessage = Color.fromRGBO(30, 36, 40, 1);
const mobileChatBoxColor = Color.fromRGBO(31, 44, 52, 1);
const greyColor = Colors.grey;
const blackColor = Colors.black;



//flutter run -d chrome --web-renderer htmlY

class BrandColors{
  static const Color colorPrimary = Color(0xFF24204b);
  static const Color colorPrimaryDark = Color(0xFF171430);
  static const Color colorAccent = Color(0xFF21ba45);
  static const Color colorWhite = Color(0xFFFBFAFF);

  static const Color colorBackground = Color(0xFFFBFAFF);
  static const Color colorPink = Color(0xFFE66C75);
  static const Color colorOrange = Color(0xFFE8913A);
  static const Color colorBlue = Color(0xFF2254A3);
  static const Color colorText = Color(0xFFFBFAFF);
  static const Color colorTextLight = Color(0xFF918D8D);
  static const Color colorTextSemiLight = Color(0xFF737373);
  static const Color colorTextDark = Color(0xFF292828);
  static const Color colorGreen = Color(0xFF40cf89);
  static const Color colorLightGray = Color(0xFFe2e2e2);
  static const Color colorLightGrayFair = Color(0xFFe1e5e8);
  static const Color colorDimText = Color(0xFFD2DCF7);
  static const Color colorPurple= Color(0xFF8F73F8);
  static const Color snackBarColor= Colors.indigo;


}


  const String uri = "https://apihomechef.antopolis.xyz/api/admin";
const Color aPrimaryColor = Color(0xFFFEC61C);

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
 const Color navyBlueColor= Color(0xff314579);
const defaultPadding = 16.0;
const Color aNavBarColor = Colors.white;
const Color buttonColor = Color(0xFFF02E6A);
const Color aSearchFieldColor = Color(0xFFF4F4F4);
const Color aBackgroundColor =  Color(0xFF1A1A1A);

const Color aTextColor = Color(0xFF1A1A1A);
const Color aPriceTextColor = Color(0xFFA53034);



myStyle (double size,[Color? color,FontWeight ?fw]){
  return GoogleFonts.roboto(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
myStyles14 (){
  return GoogleFonts.roboto(
    fontSize: 14,
    color: BrandColors.colorText,

  );
}myStyles12 (){
  return GoogleFonts.roboto(
    fontSize: 12,
    color: BrandColors.colorText,

  );
}
myStyles16 (){
  return GoogleFonts.roboto(
    fontSize: 16,
    color: BrandColors.colorText,
    fontWeight: FontWeight.w400,
  );
}

myStyles18 (){
  return GoogleFonts.roboto(
    fontSize: 18,
    color: BrandColors.colorText,
    fontWeight: FontWeight.w700,
  );
}

myStyles20 (){
  return GoogleFonts.roboto(
    fontSize: 20,
    color: BrandColors.colorText,
    fontWeight: FontWeight.w700,
  );
}
