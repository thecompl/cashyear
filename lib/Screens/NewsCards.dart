import 'package:citytimes/Constant/Colors/Colors.dart';
import 'package:citytimes/Constant/Strings/Strings.dart';
import 'package:citytimes/Constant/TextStyles/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class NewsCard extends StatefulWidget {
  final String? url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  const NewsCard({Key? key, this.url,
      this.imgUrl,
      this.primaryText,
      this.secondaryText,
      this.sourceName,
      this.author,
      this.publishedAt}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  bool showcard = false;

  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds:200));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              setState(() {
                showcard = !showcard;
              });
              },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    switch (controller.status) {
                      case AnimationStatus.completed:
                        controller.reverse();
                        break;
                      case AnimationStatus.dismissed:
                        controller.forward();
                        break;
                      default:
                    }
                      setState(() {
                        showcard = !showcard;
                      });

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    child: Image.network(
                      widget.imgUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Text(
                    widget.primaryText!,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.secondaryText!,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
                  child: Text(
                    "swipe left for more at ${widget.sourceName} by ${widget.author} /",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          showcard == true?
          Stack(
          children: [


            Container(
              width: double.infinity,
              height:100,
              child: Image.network(widget.imgUrl!,fit:BoxFit.cover),
            ),

            Container(
              width: double.infinity,
              height:100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.black87
                    ]
                )
              ),
            ),

            Container(

              decoration: BoxDecoration(
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
              padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 100,
                child: Text(
                  "Tap to read full story at ${widget.sourceName}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ):Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height:100,
                    child: Image.network(widget.imgUrl!,fit:BoxFit.cover),
                  ),

                  Container(
                    width: double.infinity,
                    height:100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.black54
                            ]
                        )
                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 100,
                      child: Text(
                        "Tap to read full story at ${widget.sourceName}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SlideTransition(
                // Provide an optional curve to make the animation feel smoother.
                position: offset,
                child: Container(
                  padding: EdgeInsets.only(left:30,right:30,top: 20),
                  height:size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.favorite_border,size: 35,),
                          SizedBox(height: 10),
                          Text(ConstStr.like,style: TextStyles.withColor(TextStyles.mn12,MyColors.black),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.bookmark_border,size: 35,),
                          SizedBox(height: 10),
                          Text(ConstStr.bookmark,style: TextStyles.withColor(TextStyles.mn12,MyColors.black),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share,size: 35),
                          SizedBox(height: 10),
                          Text(ConstStr.share,style: TextStyles.withColor(TextStyles.mn12,MyColors.black),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )


        ],
      ),

    );
  }
  // zoomimage(image){
  //  return PinchZoom(
  //     child: Image.network(image),
  //     resetDuration: const Duration(milliseconds: 100),
  //     maxScale: 2.5,
  //     onZoomStart: (){print('Start zooming');},
  //     onZoomEnd: (){print('Stop zooming');},
  //   );
  // }
}

// class NewsCard extends StatelessWidget {
//   final String? url,
//       imgUrl,
//       primaryText,
//       secondaryText,
//       sourceName,
//       author,
//       publishedAt;
//
//   bool showcard = false;
//
//   NewsCard(
//       {this.url,
//       this.imgUrl,
//       this.primaryText,
//       this.secondaryText,
//       this.sourceName,
//       this.author,
//       this.publishedAt});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//
//               GestureDetector(
//                 onTap: (){
//                   print("hii");
//
//
//                   zoomimage(imgUrl!);
//                 },
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: double.infinity,
//                   color: Colors.grey.withOpacity(0.2),
//                   child: Image.network(
//                     imgUrl!,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
//                 child: Text(
//                   primaryText!,
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     secondaryText!,
//                     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
//                   )),
//               Container(
//                 padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
//                 child: Text(
//                   "swipe left for more at $sourceName by $author /",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w300,
//                       fontSize: 12.0,
//                       color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//           showcard == true?
//           Container(
//
//             child: RaisedButton(
//               color: Theme.of(context).primaryColor,
//               onPressed: () {
//                 // Utils.launchURL(url);
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 100,
//                 child: Center(
//                     child: Text(
//                       "Tap to read full story at $sourceName",
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ),
//             ),
//           ):Container()
//         ],
//       ),
//
//     );
//   }
//   zoomimage(image){
//    return PinchZoom(
//       child: Image.network(image),
//       resetDuration: const Duration(milliseconds: 100),
//       maxScale: 2.5,
//       onZoomStart: (){print('Start zooming');},
//       onZoomEnd: (){print('Stop zooming');},
//     );
//   }
// }
