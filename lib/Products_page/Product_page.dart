import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

List<String> list = <String>['Mobile', 'Watches', 'Computer', 'Accessories'];


class Product_Page extends StatefulWidget {
  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  final TextEditingController productname = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController price2 = TextEditingController();
  final TextEditingController stocks = TextEditingController();
  final TextEditingController offerprice = TextEditingController();
  final TextEditingController productdescription = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController soldby = TextEditingController();
  final TextEditingController code = TextEditingController();

  String productname2="";
  int pricei = 0;
  int price2i = 0;
  int stocksi=0;
  int offerpricei = 0;
  String productdesp='';
  String brand2='';
  String soldby2='';
  int codei = 0;

  String dropdownValue = list.first;

  int istrue = 0;


  var NetImage =
      "https://www.pngitem.com/pimgs/m/115-1156789_watches-png-image-watch-images-png-transparent-png.png";

  int dotsize = 0;

  totalproducts() async {
    setState(() {
      dotsize=0;
    });
    var document1 =
        await FirebaseFirestore.instance.collection("Shops").get();
    for(int i=0;i<document1.docs.length;i++){

      setState(() {
        dotsize = document1.docs[i]["amount"] + dotsize;
      });

    }
    print(dotsize);
  }

  @override
  void initState() {
    totalproducts();
    totalvenders();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _showMyDialog1(id,amount,name,address) async {
    return showDialog<void>(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('The amount need to be paid'),
          content:  SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text('Amount : ${amount}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Mark as Paid'),
              onPressed: () {
                paidvender(id,amount,name,address);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _aprovevender(id,name) async {
    return showDialog<void>(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure of approve vender'),
          content:  SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text('Vender : ${name}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                approvevender(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _deleteproduct(id) async {
    return showDialog<void>(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure of delete product'),
          content:  SingleChildScrollView(
            child: ListBody(
              children:  const <Widget>[
               Text("This operation can not be Undone")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                deleteproduct(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  paidvender(id,amount,name,address){
    FirebaseFirestore.instance
        .collection('Shops').doc(id).update({
      "amount":0
    }
    );
    FirebaseFirestore.instance
        .collection('Vendorsettlements').doc().set({
      "amount":amount,
      "venderid":id,
      "name":name,
      "address":address,
      "time":"${DateTime.now().hour} : ${DateTime.now().minute}",
      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "timestamp": DateTime.now().microsecondsSinceEpoch,
    }
    );
    totalproducts();

  }
  approvevender(id){
    FirebaseFirestore.instance
        .collection('Shops').doc(id).update({
      "status":"verified"
    }
    );


  }
  deleteproduct(productid){
    FirebaseFirestore.instance
        .collection('Shops').doc(id).collection("Products").doc(productid).delete();


  }
  String vendername ="";
  String id ="";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SlideInRight(
        duration: Duration(milliseconds: 94),
        child: SingleChildScrollView(
            child: istrue == 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          //overview Text
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vendors",
                              style: GoogleFonts.mulish(
                                  color: Color(0xff252733),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          //card design1
                          Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: height / 4.69,
                              width: width / 4.017,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    Color(0xff6BAAFC),
                                    Color(0xff305FEC)
                                  ])),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: SvgPicture.asset(
                                            "assets/Vector.svg",
                                            height: 50,
                                            width: 50,
                                            color: Colors.white,
                                          )),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Total Venders",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              child: Text(
                                                totalvendor.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 60),
                                              ),
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: width / 34.15),

                          //card design2
                          Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: height / 4.69,
                              width: width / 4.017,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors:  [
                                    Color(0xffEF5E7A),
                                    Color(0xffD35385)
                                  ])
                              ),
                              child: Column(
                                children: [
                                  //shipp text

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: SvgPicture.asset(
                                            "assets/Vector.svg",
                                            height: 50,
                                            width: 50,
                                            color: Colors.white,
                                          )),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Total Amount to be paid",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              child: Text(
                                                  dotsize.toString(),
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 60),
                                              ),
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //value text
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 38.32,
                          ),

                          //card 3 and 4 designs

                          Column(
                            children: [
                              //card 3
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    istrue = 1;
                                  });
                                },
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: height / 12.16,
                                    width: width / 4.49,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(colors: [
                                          Color(0xffFCB16B),
                                          Color(0xffEC3030)
                                        ])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: width / 136.6,
                                        ),
                                        Text(
                                          "New Vendors",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height / 65.7,
                              ),
                              //card 4
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    istrue = 2;
                                  });
                                },
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: height / 12.16,
                                    width: width / 4.49,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(colors: [
                                          Color(0xffFCB16B),
                                          Color(0xffEC3030)
                                        ])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "View Settlements",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          width: width / 1.24,
                          height: height / 0.93,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Shops').where("status",isEqualTo: "verified")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData==null){
                                return Container();
                              }
                              if(!snapshot.hasData){
                                return Container();
                              }
                              return GridView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 15,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Color(0xff000000)),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: height / 131.4,
                                                  bottom: height / 131.4,left: 12.5 ),
                                              width: width / 7.58,
                                              height: height / 4.38,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['imgurl']))),
                                            ),

                                            //product name
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: width / 136.6,
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    snapshot.data!.docs[index]
                                                        ['name'],
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 273.2,
                                                ),

                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 219,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width / 136.6,
                                                ),
                                                Container(
                                                  width: 80,
                                                  child: Text(
                                                    snapshot.data!.docs[index]
                                                        ['address'],
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 219,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width / 136.6,
                                                ),
                                                Text(
                                                  "Amount to settle:",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Container(
                                                  width: 40,
                                                  child: Text(
                                                    snapshot.data!
                                                        .docs[index]['amount']
                                                        .toString(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 136.6,
                                                ),
                                               ],
                                            ),
                                            SizedBox(
                                              height: height / 65.7,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                //edit button
                                                GestureDetector(
                                                  child: Container(
                                                    height: height / 25.26,
                                                    width: width / 20.39,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Color(0xffFCB16B),
                                                              Color(0xffEC3030),
                                                            ])),
                                                    child: Center(
                                                      child: Text(
                                                        "Pay Now",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    _showMyDialog1(snapshot.data!.docs[index].id,snapshot.data!.docs[index]["amount"],snapshot.data!.docs[index]["name"],snapshot.data!.docs[index]["address"]);
                                                    print("edit product");
                                                  },
                                                ),
                                                //change text  button
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      istrue=4;
                                                      id=snapshot.data!.docs[index].id;
                                                      vendername=snapshot.data!.docs[index]["name"];
                                                    });
                                                  },
                                                  child: Container(
                                                    height: height / 25.26,
                                                    width: width / 11.34,
                                                    margin: EdgeInsets.only(
                                                        left: width / 273.2),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color(0xffFCB16B),
                                                            Color(0xffEC3030),
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "View Product",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 2,
                                    childAspectRatio: 80 / 100,
                                    mainAxisSpacing: 2,
                                  ));
                            },
                          ))
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                : istrue == 1? SlideInRight(
              duration: Duration(milliseconds:94),
              child: SingleChildScrollView(
                child: Container(
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
                                  GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          istrue = 0;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_back_ios_rounded),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8,top: 32,bottom: 32),
                                    child: Text("New Vendors",style: GoogleFonts.mulish(fontSize: 19,
                                      color: Color(0xff252733),
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),

                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Si.no",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),

                                  Text("Vender Name",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),


                                  Text("Address",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: Text("Description",style: GoogleFonts.mulish(
                                        color: Color(0xff9FA2B4),fontSize: 14,
                                        fontWeight: FontWeight.w700),),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.only(left: 80.0),
                                    child: Text("Phone Number",style: GoogleFonts.mulish(
                                        color: Color(0xff9FA2B4),fontSize: 14,
                                        fontWeight: FontWeight.w700),),
                                  ),
                                  Text("Status",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),


                                ],
                              ),


                              Divider(),


                              SizedBox(height:  height/32.85,),


                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('Shops').orderBy("timestamp",descending: true).snapshots(),
                                  builder: ( context,  snapshot) {

                                    if(snapshot.hasData==null){
                                      return Container();
                                    }
                                    if(!snapshot.hasData){
                                      return Container();
                                    }
                                    return
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context,index){

                                            var d1 = snapshot.data!.docs[index];
                                            return d1["status"]=="Unverified"? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(left: 60),
                                                      width: width/34.15,
                                                      child: Center(
                                                        child: Text((index+1).toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: width/13.66,
                                                      margin: EdgeInsets.only(left: 75),
                                                      child: Center(
                                                        child: Text(d1['name'].toString(),style: GoogleFonts.mulish(
                                                          color: Colors.indigoAccent,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w700,),),
                                                      ),
                                                    ),



                                                    Container(
                                                      width: width/12.41,
                                                      margin: EdgeInsets.only(left: 40),
                                                      child: Center(
                                                        child: Text(d1["address"].toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: width/4.66,

                                                      margin: EdgeInsets.only(left: 20),
                                                      child: Center(
                                                        child: Text("${d1["des"]}",style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                                                      ),
                                                    ),




                                                    Container(
                                                      width: width/15.32,

                                                      margin: EdgeInsets.only(left: 70,right: 50),
                                                      child: Center(
                                                        child: Text(d1['phone'].toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),


                                                    GestureDetector(
                                                      onTap:(){
                                                        _aprovevender(d1.id,d1["name"]);

                                                      },
                                                      child: Container(
                                                        height:height/27.375,
                                                        width: width/14.53,
                                                        decoration: BoxDecoration(
                                                            color: Colors.redAccent,
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
            ) :istrue == 2?  SlideInRight(
              duration: Duration(milliseconds:94),
              child: SingleChildScrollView(
                child: Container(
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
                                  GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        istrue = 0;
                                      });
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_back_ios_rounded),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8,top: 32,bottom: 32),
                                    child: Text("Vendor Settlements",style: GoogleFonts.mulish(fontSize: 19,
                                      color: Color(0xff252733),
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),

                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Si.no",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),

                                  Text("Vender Name",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),


                                  Text("Address",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: Text("Amount",style: GoogleFonts.mulish(
                                        color: Color(0xff9FA2B4),fontSize: 14,
                                        fontWeight: FontWeight.w700),),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.only(left: 65.0),
                                    child: Text("Date",style: GoogleFonts.mulish(
                                        color: Color(0xff9FA2B4),fontSize: 14,
                                        fontWeight: FontWeight.w700),),
                                  ),
                                  Text("Time",style: GoogleFonts.mulish(
                                      color: Color(0xff9FA2B4),fontSize: 14,
                                      fontWeight: FontWeight.w700),),


                                ],
                              ),


                              Divider(),


                              SizedBox(height:  height/32.85,),


                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('Vendorsettlements').orderBy("timestamp",descending: true).snapshots(),
                                  builder: ( context,  snapshot) {
                                    if(snapshot.hasData==null){
                                      return Container();
                                    }
                                    if(!snapshot.hasData){
                                      return Container();
                                    }
                                    return
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context,index){

                                            var d1 = snapshot.data!.docs[index];
                                            return  Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(left: 85),
                                                      width: width/34.15,
                                                      child: Center(
                                                        child: Text((index+1).toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: width/13.66,
                                                      margin: EdgeInsets.only(left: 75),
                                                      child: Center(
                                                        child: Text(d1['name'].toString(),style: GoogleFonts.mulish(
                                                          color: Colors.indigoAccent,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w700,),),
                                                      ),
                                                    ),



                                                    Container(
                                                      width: width/12.41,
                                                      margin: EdgeInsets.only(left: 65),
                                                      child: Center(
                                                        child: Text(d1["address"].toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: width/4.66,

                                                      margin: EdgeInsets.only(left: 20),
                                                      child: Center(
                                                        child: Text("${d1["amount"]}",style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                                                      ),
                                                    ),




                                                    Container(
                                                      width: width/15.32,

                                                      margin: EdgeInsets.only(left: 20,right: 50),
                                                      child: Center(
                                                        child: Text(d1['date'].toString(),style: GoogleFonts.mulish(
                                                            color: Color(0xff9FA2B4),fontSize: 14,
                                                            fontWeight: FontWeight.w700),),
                                                      ),
                                                    ),


                                                    GestureDetector(
                                                      onTap:(){
                                                        _aprovevender(d1.id,d1["name"]);

                                                      },
                                                      child: Container(
                                                        height:height/27.375,
                                                        width: width/14.53,
                                                        decoration: BoxDecoration(
                                                            color: Colors.redAccent,
                                                            borderRadius: BorderRadius.circular(100)
                                                        ),
                                                        child:Center(
                                                          child: Text(d1['time'],
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
                                            );
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
            ) :Column(
              children: [
                Row(
                  children: [
                    //overview Text
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          istrue=0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${vendername} - Products",
                        style: GoogleFonts.mulish(
                            color: Color(0xff252733),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                    width: width / 1.24,
                    height: height / 0.93,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Shops').doc(id).collection("Products")
                          .snapshots(),
                      builder: (context, snapshot) {

                        if(snapshot.hasData==null){
                          return Container();
                        }
                        if(!snapshot.hasData){
                          return Container();
                        }
                        return GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 15,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Color(0xff000000)),
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: height / 131.4,
                                            bottom: height / 131.4,left: 12.5 ),
                                        width: width / 7.58,
                                        height: height / 4.38,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),

                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    snapshot.data!
                                                        .docs[index]
                                                    ['image']))),
                                      ),

                                      //product name
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 136.6,
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                              ['name'],
                                              style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  textStyle: TextStyle(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 273.2,
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 219,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width / 136.6,
                                          ),
                                          Container(
                                            width: 80,
                                            child: Text(
                                              "Price: ${snapshot.data!.docs[index]
                                              ['price']}".toString(),
                                              style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  textStyle: TextStyle(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 219,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width / 136.6,
                                          ),
                                          Text(
                                            "Quantity:  ",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                            width: 120,

                                            child: Text(
                                              snapshot.data!
                                                  .docs[index]['quantity'].toString()
                                                  .toString(),
                                              style: GoogleFonts.inter(
                                                  fontSize: 13,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  textStyle: TextStyle()),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 136.6,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 65.7,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _deleteproduct(snapshot.data!.docs[index].id);

                                            },
                                            child: Container(
                                              height: height / 25.26,
                                              width: width / 8.34,
                                              margin: EdgeInsets.only(
                                                  left: width / 273.2),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xffFCB16B),
                                                      Color(0xffEC3030),
                                                    ]),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    15),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Delete Product",
                                                  style:
                                                  GoogleFonts.inter(
                                                      fontWeight:
                                                      FontWeight
                                                          .w700,
                                                      color: Colors
                                                          .white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 2,
                              childAspectRatio: 80 / 100,
                              mainAxisSpacing: 2,
                            ));
                      },
                    ))
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )

                //product page and forn page designs

               ),
      ),
    );
  }
/*  SlideInRight(
                    duration: Duration(milliseconds: 94),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //add employee text and design
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        istrue = true;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_back_outlined)),
                                SizedBox(
                                  width: width / 136.6,
                                ),
                                Text(
                                  'Add New Products',
                                  style: GoogleFonts.inter(
                                      fontSize: width / 56.91,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: height / 13.14),

                          Center(
                            child: Material(
                              color: Colors.white38,
                              surfaceTintColor: Color(0xff0B014B),
                              shadowColor: Color(0xff0B014B),
                              elevation: 55,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                width: width / 1.39,
                                height: height / 1.02,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 68.3, right: width / 68.3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height / 13.14),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //dropdown design
                                          Card(
                                            elevation: 10,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: width / 68.3),
                                              width: width / 7.00,
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                value: dropdownValue,
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_rounded),
                                                elevation: 16,
                                                underline: SizedBox(),
                                                style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                ),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    dropdownValue = value!;
                                                  });
                                                },
                                                items: list.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),

                                          //button design
                                          Row(
                                            children: [
                                              //cancel button design
                                              GestureDetector(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff808080),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  width: width / 13.66,
                                                  height: height / 15.64,
                                                  child: Center(
                                                      child: Text(
                                                    'Cancel',
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )),
                                                ),
                                                onTap: () {
                                                  print('cancel button');
                                                  clearall();
                                                },
                                              ),

                                              SizedBox(width: width / 32.85),

                                              //save button design
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    productname2 = productname.text.toString();
                                                    pricei = int.parse(price.text);
                                                    price2i = int.parse(price2.text);
                                                    stocksi = int.parse(stocks.text) ;
                                                    offerpricei = int.parse(offerprice.text);
                                                    productdesp = productdescription.text.toString();
                                                    brand2 = brand.text.toString();
                                                    soldby2 = soldby.text.toString();
                                                    codei= int.parse(code.text);
                                                  });

                                                  print(productname2);
                                                  print(pricei);
                                                  print(price2i);
                                                  print(stocksi);
                                                  print(offerpricei);
                                                  print(productdesp);
                                                  print(brand2);
                                                  print(soldby2);
                                                  print(codei);
                                                  update(imgUrl);
                                                  clearall();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff109CF1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  width: width / 13.66,
                                                  height: height / 15.64,
                                                  child: Center(
                                                      child: Text(
                                                    'Save',
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: height / 32.85),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //product name text
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Product Name*',
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                        fontSize:
                                                            width / 97.57)),
                                                SizedBox(
                                                  height: height / 82.12,
                                                ),
                                                Container(
                                                    height: height / 16.42,
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: productname,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            width: width / 46.65,
                                          ),

                                          //stock availalble text
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Stocks Available',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                  height: height / 82.12,
                                                ),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: stocks,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            width: width / 46.65,
                                          ),

                                          //price text
                                          Container(
                                            width: width / 8.9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Price',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                  height: height / 131.4,
                                                ),
                                                Container(
                                                    height: height / 16.42,
                                                    width: width / 13.66,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),

                                                        controller: price,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            width: width / 46.65,
                                          ),

                                          //offer text
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Offer Price',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(height: height / 65.7),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: offerprice,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 32.85),
                                      //product des text
                                      Row(
                                        children: [
                                          Container(
                                            width: width / 1.51,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Product Description',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                  height: height / 131.4,
                                                ),
                                                Container(
                                                    height: height / 6.98,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller:
                                                            productdescription,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 32.85),
                                      //brand and sold by text
                                      Row(
                                        children: [
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Brand',
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                        fontSize:
                                                            width / 97.57)),
                                                SizedBox(
                                                    height: height / 131.4),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: brand,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 46.65,
                                          ),
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Sold By',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                    height: height / 131.4),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 10,
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: soldby,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 32.85),
                                      //code and price text
                                      Row(
                                        children: [
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Code',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                    height: height / 131.4),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      elevation: 10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: code,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: width / 45.53),
                                          Container(
                                            width: width / 6.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Price 2',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: width / 97.57,
                                                    )),
                                                SizedBox(
                                                  height: height / 131.4,
                                                ),
                                                Container(
                                                    height: height / 16.42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      elevation: 10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: TextFormField(
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.black,
                                                          fontSize: width / 110,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        controller: price2,
                                                        cursorColor:
                                                            Color(0xff5138EE),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            isCollapsed: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            60,
                                                                    left: width /
                                                                        186.6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 32.85),
                                      //upload dotted designs
                                      Row(
                                        children: [
                                          GestureDetector(

                                            onTap: () => uploadToStorage(),

                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(10),
                                              dashPattern: [5, 5],
                                              color: Color(0xff5138EE),
                                              strokeWidth: 2,
                                              child: Container(
                                                  width: width / 6.22,
                                                  height: height / 8.69,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Icon(
                                                        Icons.upload_file,
                                                        color:
                                                            Color(0xff5138EE),
                                                        size: width / 46.65,
                                                      ),
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Text(
                                                          'Select the Main Image to Upload',
                                                          style: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  width / 124.4,
                                                              color: Color(
                                                                  0xff0B014B)))
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 68.3,
                                          ),
                                          GestureDetector(
                                            onTap: () => uploadToStorage(),
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(10),
                                              dashPattern: [5, 5],
                                              color: Color(0xff5138EE),
                                              strokeWidth: 2,
                                              child: Container(
                                                  width: width / 6.22,
                                                  height: height / 8.69,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Icon(
                                                        Icons.upload_file,
                                                        color:
                                                            Color(0xff5138EE),
                                                        size: width / 46.65,
                                                      ),
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Text(
                                                          'Select the second image to Upload',
                                                          style: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  width / 124.4,
                                                              color: Color(
                                                                  0xff0B014B)))
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 68.3,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('slected');
                                              uploadToStorage();
                                            },
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(10),
                                              dashPattern: [5, 5],
                                              color: Color(0xff5138EE),
                                              strokeWidth: 2,
                                              child: Container(
                                                  width: width / 6.22,
                                                  height: height / 8.69,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Icon(
                                                        Icons.upload_file,
                                                        color:
                                                            Color(0xff5138EE),
                                                        size: width / 46.65,
                                                      ),
                                                      SizedBox(
                                                        height: height / 104.3,
                                                      ),
                                                      Text(
                                                          'Select the third Image to Upload',
                                                          style: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize:
                                                                  width / 124.4,
                                                              color: Color(0xff0B014B)))
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 32.85),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )*/  // form Page
  String imgUrl = "";
  String fileName = Uuid().v1();

  uploadToStorage() async {
    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs
            .ref()
            .child('sliderimages')
            .child("${file.name}")
            .putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
        print(imgUrl);
      });
    });
    print(imgUrl);
  }

  update(url) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('slider')
        .doc(DateTime.now().microsecondsSinceEpoch.toString())
        .set({
      "urls": url,
      'timestamp': DateTime.now().microsecondsSinceEpoch,
      'product name': productname2,
      'stocks': stocksi,
      'price': pricei,
      'offer price': offerpricei,
      'product descrip': productdesp,
      'brand': dropdownValue,
      'sold by': soldby2,
      'code': codei,
      'price2': price2i,
    });
  }

  clearall() {
    productname.clear();
    price.clear();
    price2.clear();
    stocks.clear();
    offerprice.clear();
    productdescription.clear();
    brand.clear();
    soldby.clear();
    code.clear();
  }

  //buy the product
  Stockdecresecount() {
    FirebaseFirestore.instance.collection('slider').doc().update({
      "stocks": FieldValue.increment(-1),
    });
  }
  int totalvendor=0;
  totalvenders() async {
   var doc1 = await FirebaseFirestore.instance.collection('Shops').where("status",isEqualTo: "verified").get();
   setState(() {
     totalvendor=doc1.docs.length;
   });
  }
}
