import 'package:citytimes/Constant/Colors/Colors.dart';
import 'package:citytimes/Constant/Strings/Strings.dart';
import 'package:citytimes/Constant/TextStyles/Textstyles.dart';
import 'package:flutter/material.dart';
class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            padding: EdgeInsets.only(left: 15,top: 10),
            height: size.height*0.05,
              width: size.width,
            color: MyColors.black,
            child: Text(ConstStr.app_name,style: TextStyles.withColor(TextStyles.mb16, MyColors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:MyColors.blue,
                  ),
                  width: size.width*0.5,
                  padding: EdgeInsets.all(10),

                  child: Row(children: [
                    Image.asset("lib/assets/images/phone-call.png",height:size.height*0.04),
                    SizedBox(width:10),
                    Text(ConstStr.signuphone,style:TextStyles.withColor(TextStyles.mb12, MyColors.white),)
                  ],),
                ),
                SizedBox(height: 10),
                Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
    color:MyColors.bluefb),
                  width: size.width*0.5,
                  padding: EdgeInsets.all(10),

                  child: Row(children: [
                    Image.asset("lib/assets/images/facebook.png",height:size.height*0.04),
                    SizedBox(width:10),
                    Text(ConstStr.signupfb,style:TextStyles.withColor(TextStyles.mb12, MyColors.white),)
                  ],),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color:MyColors.black
                  ),
                  width: size.width*0.5,
                  padding: EdgeInsets.all(10),

                  child: Row(children: [
                    Image.asset("lib/assets/images/google.png",height:size.height*0.04),
                    SizedBox(width:10),
                    Text(ConstStr.signugoogle,style:TextStyles.withColor(TextStyles.mb12, MyColors.white),)
                  ],),
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
