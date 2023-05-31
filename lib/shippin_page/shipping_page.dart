import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shippping_Page extends StatefulWidget {
  const Shippping_Page({Key? key}) : super(key: key);

  @override
  State<Shippping_Page> createState() => _Shippping_PageState();
}

class _Shippping_PageState extends State<Shippping_Page> {
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body:  SlideInRight(
        duration: Duration(milliseconds:94),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Card(
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
                      //text orders
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:32,top: 32,bottom: 32),
                            child: Text("Shipped orders",style: GoogleFonts.mulish(fontSize: 19,
                              color: Color(0xff252733),
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                          GestureDetector(
                            onTap: (){
                              print("filter order");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 100),
                              child: Row(
                                children: [
                                  Icon(Icons.filter_alt_rounded,color: Color(0xffC5C7CD),),
                                  Text("Filter",style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4B506D)),)
                                ],
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Si.no",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),

                          Text("Order No",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),


                          Text("Customer name",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Date",style: GoogleFonts.mulish(
                                color: Color(0xff9FA2B4),fontSize: 14,
                                fontWeight: FontWeight.w700),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Product Catagory",style: GoogleFonts.mulish(
                                color: Color(0xff9FA2B4),fontSize: 14,
                                fontWeight: FontWeight.w700),),
                          ),

                          Text("Vender Name",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),

                          Text("Phone Number",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),
                          Text("Address",style: GoogleFonts.mulish(
                              color: Color(0xff9FA2B4),fontSize: 14,
                              fontWeight: FontWeight.w700),),

                          Container(
                            height: height/36.5,
                            width: width/13.13,),
                        ],
                      ),


                      Divider(),


                      SizedBox(height:  height/32.85,),


                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
                          builder: ( context,  snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context,index){

                                    var d1 = snapshot.data!.docs[index];
                                    return d1["status"] =="delivered" ?Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 30),
                                              width: width/34.15,
                                              child: Center(
                                                child: Text((index+1).toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),
                                            Container(
                                              width: width/13.66,
                                              margin: EdgeInsets.only(left: 20),
                                              child: Center(
                                                child: Text(d1['orderid'].toString(),style: GoogleFonts.mulish(
                                                  color: Colors.indigoAccent,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,),),
                                              ),
                                            ),



                                            Container(
                                              width: width/12.41,
                                              margin: EdgeInsets.only(left: 20),
                                              child: Center(
                                                child: Text(d1["name"].toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),


                                            Container(
                                              width: width/13.66,
                                              margin: EdgeInsets.only(left: 20),
                                              child: Center(
                                                child: Text("${d1['date'].toString()} \n ${d1['time'].toString()}",style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                                              ),
                                            ),


                                            Container(
                                              width: width/11.38,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Center(
                                                child: Text(d1['type'].toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),

                                            Container(
                                              width:width/ 11.38,
                                              margin: EdgeInsets.only(left: 20),
                                              child: Center(
                                                child: Text(d1['vender'].toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),


                                            Container(
                                              width: width/15.32,

                                              margin: EdgeInsets.only(left: 20,right: 50),
                                              child: Center(
                                                child: Text(d1['phone'].toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),
                                            Container(
                                              width: width/27.32,
                                              margin: EdgeInsets.only(left: 0,right: 50),
                                              child: Center(
                                                child: Text(d1['address'].toString(),style: GoogleFonts.mulish(
                                                    color: Color(0xff9FA2B4),fontSize: 14,
                                                    fontWeight: FontWeight.w700),),
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap:(){

                                              },
                                              child: Container(
                                                height:height/27.375,
                                                width: width/14.53,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff29CC97),
                                                    borderRadius: BorderRadius.circular(100)
                                                ),
                                                child:Center(
                                                  child: Text(d1['status'],
                                                      style:GoogleFonts.mulish(
                                                        fontSize: 11,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700
                                                        ,)),
                                                ),
                                              ),
                                            ),
                                          ],

                                        ),
                                        SizedBox(height: height/32.85,),
                                        Divider(),
                                        SizedBox(height: height/32.85,),


                                      ],
                                    ) : Container();
                                  });
                          }
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
