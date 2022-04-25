import 'package:citytimes/Constant/Colors/Colors.dart';
import 'package:citytimes/Constant/Strings/Strings.dart';
import 'package:citytimes/Constant/TextStyles/Textstyles.dart';
import 'package:citytimes/Constant/navigaotors/Navagate_Next.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SignupPage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  List<bool> ? isSelected;
  var textValue = 'Switch is OFF';
  void initState(){
    isSelected = [true, false];
    super.initState();
  }
 toggleSwitch(bool index) {
      setState(() {
        for (int i = 0; i < isSelected!.length;i++) {
          isSelected![i] = i == index;
        }
      });

    // if(isSwitched == false)
    // {
    //   setState(() {
    //     isSwitched = true;
    //     textValue = 'Switch Button is ON';
    //   });
    //   print('Switch Button is ON');
    // }
    // else
    // {
    //   setState(() {
    //     isSwitched = false;
    //     textValue = 'Switch Button is OFF';
    //   });
    //   print('Switch Button is OFF');
    // }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width:10),
                  Container(
                    child: Text("Options",style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                nextScreen(context,Signuppage());
              },
              child: Container(
                padding: EdgeInsets.only(left:20,top: 20,right: 15),
                decoration: BoxDecoration(
                    color: MyColors.primarycolor
                ),
                height:size.height*0.18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ConstStr.savepre,style: TextStyles.withColor(TextStyles.mb16, MyColors.white),),
                    SizedBox(height:10),
                    Text("Sign in to save your Likes\nand Bookmarks",style: TextStyles.withColor(TextStyles.mn12,MyColors.white),),
                    SizedBox(height:30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: (){
                            nextScreen(context,Signuppage());
                        }, child: Text(ConstStr.sign_in,style: TextStyles.mn12,)),
                        Row(
                          children: [
                            Image.asset("lib/assets/images/facebook.png",height: size.height*0.03,),
                            SizedBox(width: 10),
                            Image.asset("lib/assets/images/google.png",height: size.height*0.03),
                            SizedBox(width: 10),
                            Image.asset("lib/assets/images/phone-call.png",height: size.height*0.03)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  menulist(Icons.language,ConstStr.noti,false),
                  Divider(),
                  menulist(Icons.dark_mode,ConstStr.nightmode,false),
                  Divider(),
                  
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.font_download),
                          SizedBox(width:10),
                          Text(ConstStr.fontsize,style: TextStyles.withColor(TextStyles.mn14, MyColors.black),),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.font_download),
                          SizedBox(width:10),
                          Text(ConstStr.lang,style: TextStyles.withColor(TextStyles.mn14, MyColors.black),),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  urllaunchmenu(Icons.description,ConstStr.about,"https://blog.logrocket.com/launching-urls-flutter-url_launcher/"),
                  Divider(),
                  urllaunchmenu(Icons.contact_phone,ConstStr.contact,"www.google.com"),
                  Divider(),
                  urllaunchmenu(Icons.policy,ConstStr.policy,"www.google.com")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  menulist(icon,txt,index){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width:10),
              Text(txt,style: TextStyles.withColor(TextStyles.mn14, MyColors.black),),
            ],
          ),
          Switch(
            onChanged: toggleSwitch(index),
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.blueGrey,
            inactiveTrackColor: Colors.grey,
          )
        ],
      ),
    );
  }
  urllaunchmenu(icon,txt,url){
    return  GestureDetector(
        onTap: ()async{
        if(await canLaunch(url)){
      await launch(url);
      }else {
      throw 'Could not launch $url';
      }
    },
           child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width:10),
            Text(txt,style: TextStyles.withColor(TextStyles.mn14, MyColors.black),),
          ],
        ),
      ),
    );
  }

}
