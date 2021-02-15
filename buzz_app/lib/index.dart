import 'package:buzz_app/api.dart';
import 'package:buzz_app/detail.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        margin: EdgeInsets.all(20),
        height: 80,
        alignment: Alignment.centerLeft,
        child: Text(
          "Campaigns",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
          child: FutureBuilder<List<dynamic>>(
              future: Api().getCamp(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  //print(snapshot);
                  return GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        1, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: MediaQuery.of(context).size.width * 0.10,
                              child: Column(
                                children: [
                                  Container(
                                    width: 300,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data[index]["image_url"]),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data[index]["name"],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data[index]["price"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    255, 193, 7, 1)),
                                          ),
                                          //Text(snaao"data"),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                          detail: snapshot.data[index],
                                        )),
                              );
                            });
                      });

                  // return GridView.count(
                  //   crossAxisCount: 2,
                  //   children: [
                  //     InkWell(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Colors.grey.shade300),
                  //           margin: EdgeInsets.all(20),
                  //           height: MediaQuery.of(context).size.width * 0.2,
                  //           width: MediaQuery.of(context).size.width * 0.2,
                  //           child: Column(
                  //             children: [
                  //               Image.network(snapshot.data[0]["image_url"]),
                  //               Expanded(
                  //                   child: Container(
                  //                 child: Text("sss"),
                  //               )),
                  //               Container(
                  //                 padding: EdgeInsets.only(left: 10, right: 10),
                  //                 height:
                  //                     MediaQuery.of(context).size.width * 0.15,
                  //                 width: MediaQuery.of(context).size.width * 1,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.only(
                  //                       bottomLeft: Radius.circular(10),
                  //                       bottomRight: Radius.circular(10)),
                  //                   color: Colors.grey.shade400,
                  //                 ),
                  //                 child: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Text(snapshot.data[0]["name"]),
                  //                     Text(snapshot.data[0]["price"]),
                  //                     //Text(snaao"data"),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         onTap: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Detail(
                  //                       detail: "111",
                  //                     )),
                  //           );
                  //         })
                  //   ],
                  // );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }))
    ])));
  }
}
