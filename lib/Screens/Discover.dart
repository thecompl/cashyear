import 'package:citytimes/Constant/Strings/Strings.dart';
import 'package:citytimes/Constant/TextStyles/Textstyles.dart';
import 'package:flutter/material.dart';

import 'SettingScreen.dart';
class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List feature = [
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"My feed"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"Bookmarked"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"Trending"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"unread"
    },

  ];
  List cat = [
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"Politics"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"business"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"internation"
    },
    {
      "image":"lib/assets/images/Appicon.jpeg",
      "name":"India"
    },

  ];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var size = MediaQuery.of(context).size;
    return SafeArea(
      key:_scaffoldKey,
      child: Scaffold(

        drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              height: size.height*0.07,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingScreen()),
                            );
                          },
                          child: Icon(Icons.settings)),
                      Text("Discover"),
                      GestureDetector(
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                          child: Text("My feed")),
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child:Text("Topics",style: TextStyles.mb16,) ,
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.only(left: 10,),
              height: size.height*0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  itemCount:feature.length,
                  itemBuilder: (BuildContext context,int index){
                    return Feature(feature[index]['image'],feature[index]['name']);
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:Text(ConstStr.categories,style: TextStyles.mb16,) ,
            ),
           
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: size.height*0.5,
              child: GridView.builder(
                itemCount: cat.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new GridTile(
                      footer: Center(child: Text(cat[index]['name'],style: TextStyle(color: Colors.white),)),
                      child:  Image.asset(cat[index]['image']), //just for testing, will fill with image later
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Feature(image,name){
    var size  =MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
       child: Column(
         children: [
            Image.asset(image,height: size.height*0.05,),
            SizedBox(height: 5),
            Text(name,style: TextStyle(fontSize:10,letterSpacing:0.5),)
         ],
       ),
    );
  }
  categories(image,name){

    var size  = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
       child: Column(
         children: [
            Image.asset(image,height: size.height*0.05,),
            SizedBox(height: 5),
            Text(name,style: TextStyle(fontSize:10,letterSpacing:0.5),)
         ],
       ),
    );
  }
}
