
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Users_Page extends StatefulWidget {
  const Users_Page({Key? key}) : super(key: key);

  @override
  State<Users_Page> createState() => _Users_PageState();
}

class _Users_PageState extends State<Users_Page> {
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SlideInRight(
        duration: Duration(milliseconds:94),
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              )
          ),
          child: Container(
            height: height/1.072,
            width: width/1.217,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:32,top: 32,bottom: 32),
                      child: Text("Users List",style: GoogleFonts.mulish(fontSize: 19,
                        color: Color(0xff252733),
                        fontWeight: FontWeight.w700,
                      ),),
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black,
                              width: 0.5
                          ),
                          color: Theme.of(context).canvasColor,
                          boxShadow: const [BoxShadow()],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "User Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0,left: 150),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                     fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0,left: 420),
                              child: Text(
                                "Address",
                                style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65),


                      child: Container(
                        child: StreamBuilder<QuerySnapshot>(
                            stream:FirebaseFirestore.instance.collection('Users').snapshots(),
                            builder: (context, snapshot){
                              if (!snapshot.hasData) {
                                return Center(
                                  child: const CupertinoActivityIndicator(),
                                );
                              }

                              return ListView(
                                shrinkWrap: true,
                                  controller: ScrollController(),
                                  children: snapshot.data!.docs.map((document) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(bottom: 10, right: 5, left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),

                                            color: Theme
                                                .of(context)
                                                .canvasColor,
                                            boxShadow: const [BoxShadow()],
                                            border: Border.all(
                                                width: 0.2
                                            )
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0, bottom: 8.0, right: 8.0, left: 15),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    document['name'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 60),
                                              child: Row(
                                                children: [

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0, bottom: 8.0, right: 8.0, left: 200),
                                                    child: Container(
                                                      width: 150,
                                                      height: 35,
                                                      decoration: BoxDecoration(

                                                          borderRadius: BorderRadius.circular(20.0)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          document['phone'],
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0, bottom: 8.0, right: 8.0, left: 200),
                                                    child: Container(
                                                      width: 450,
                                                      height: 35,

                                                      decoration: BoxDecoration(

                                                          borderRadius: BorderRadius.circular(20.0)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          document['address'].toString(),
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),





                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  ).toList()
                              );
                            }

                        ),
                      ),

                    )

                  ],
                ),
              ],
            ),
          ),
        )
      ),

    );
  }
}
