import 'package:flutter/material.dart';

import 'description.dart';
import 'main.dart';

bool darkMode = false;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check_circle,
                  color: darkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    darkMode = darkMode ? false : true;
                  });
                })
          ],
          elevation: 0.0,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          centerTitle: true,
          title: Text(
            "Trending",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
        ),
        backgroundColor: darkMode ? Colors.black : Colors.white,
        body: FutureBuilder(
            future: getNews(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data["articles"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Desc(
                                        news: snapshot.data["articles"][index],
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: darkMode ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    color: Colors.black12.withOpacity(0.08),
                                    offset: Offset(0, 3),
                                    spreadRadius: 5)
                              ]),
                          child: Column(
                            children: [
                              Row(children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      snapshot.data["articles"][index]["title"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: !darkMode
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                    child: Container(
                                        child: Image.network(snapshot
                                                        .data["articles"][index]
                                                    ["urlToImage"] ==
                                                null
                                            ? "https://lunawood.com/wp-content/uploads/2018/02/placeholder-image.png"
                                            : snapshot.data["articles"][index]
                                                ["urlToImage"]))),
                              ]),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        snapshot.data["articles"][index]
                                            ["publishedAt"],
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey)),
                                    SizedBox(width: 15),
                                    Icon(
                                      Icons.mode_comment,
                                      color: !darkMode
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(Icons.more_vert,
                                        color: !darkMode
                                            ? Colors.black
                                            : Colors.white)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
