import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Desc extends StatefulWidget {
  Map<String,dynamic> news;
  Desc({Key key, @required this.news}) : super(key: key);
  @override
  _DescState createState() => _DescState();
  
}


bool darkMode = false;

class _DescState extends State<Desc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode?Colors.white:Colors.black
      ,
      appBar: AppBar(
        backgroundColor: darkMode? Colors.white:Colors.white30,
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
          elevation: 0,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
             Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.news["title"],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: !darkMode
                                                      ? Colors.white
                                                      : Colors.black)),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                 width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.news["urlToImage"],
                        ),
                      )
                    )
            ),
               ),
          
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.news["description"],
                  style: TextStyle(fontSize: 15, color: darkMode?Colors.black:Colors.white),
                ),
              ),
              SizedBox(
                 height: 100,
               ),
              Text(
                "Click here to read full article....",
                style:
                    TextStyle(color: darkMode?Colors.black:Colors.white , fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    child: Text(
                      widget.news["url"],
                      style: TextStyle(fontSize: 15, color: darkMode?Colors.black:Colors.white),
                    ),
                    onTap: () => launch(widget.news["url"]),
                  )
                  )
        
          ],
        ),
      ),
      
    );
  }
}