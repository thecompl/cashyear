import 'package:citytimes/Screens/Discover.dart';
import 'package:citytimes/Screens/shared_pref.dart';
import 'package:flutter/material.dart';
import 'NewsCards.dart';
import 'NewsDummy.dart';
import 'NewsModal.dart';

class MyFeed extends StatefulWidget {
  const MyFeed({Key? key}) : super(key: key);

  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  int index = 0;
  NewsModal ? newsModal;
  void initState() {
    fetchData();
    setupLastIndex();
    super.initState();
  }

  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }

  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsModal!.result!.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = newsModal!.result!.length - 1;
    } else if (index == newsModal!.result!.length - 1 &&
        direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  String getShareText() {
    return "${newsModal!.result![index].title}\n${newsModal!.result![index].url}";
  }

  Widget newsCard(int index) {
    return NewsCard(
      imgUrl: newsModal!.result![index].urlToImage,
      primaryText: newsModal!.result![index].title,
      secondaryText: newsModal!.result![index].description,
      sourceName: newsModal!.result![index].sourceName,
      author: newsModal!.result![index].author,
      publishedAt: newsModal!.result![index].publishedAt,
      url: newsModal!.result![index].url,
    );
  }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == newsModal!.result!.length - 1 ? 0 : index + 1;
    return SafeArea(
      child: Scaffold(
        body: Dismissible(
          background: newsCard(prevIndex),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                height: size.height*0.054,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){  },
                            child: Text("Discover")),
                        Text("MyFeed"),
                        Icon(Icons.refresh),
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                  height: size.height*0.91,
                  child: newsCard(index)),
            ],
          ),
          secondaryBackground: newsCard(nextIndex),
          resizeDuration: Duration(milliseconds: 10),
          key: Key(index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            updateContent(direction);
          },
        ),
      ),
    );
  }
}

a