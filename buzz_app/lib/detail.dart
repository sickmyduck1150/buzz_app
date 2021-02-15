import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Map detail;

  Detail({this.detail});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.amberAccent,
            child: Image.network(
              widget.detail["image_url"],
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.detail["name"],
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.detail["name"],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  widget.detail["price"],
                  style: TextStyle(
                      color: Color.fromRGBO(255, 193, 7, 1),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.detail["description"] != null
                    ? Text(widget.detail["description"])
                    : Text(widget.detail["decription"])
              ],
            ),
          ))
        ],
      )),
    );
  }
}
