
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/order_page/Order_page_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Dash_landing_page extends StatefulWidget {
  const Dash_landing_page({Key? key}) : super(key: key);

  @override
  State<Dash_landing_page> createState() => _Dash_landing_pageState();
}

class _Dash_landing_pageState extends State<Dash_landing_page> {


  int select=0;
  int selectedvalue=0;
  int selectedvalue2=0;
  int selectedvalue3=0;
  int selectedvalue4=0;


  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: select==0? SlideInRight(
        duration: Duration(milliseconds: 94),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  //overview Text
                  Padding(
                    padding:EdgeInsets.only(
                      left:width/170.75,
                        right: width/170.75,
                      top: height/82.125,
                      bottom: height/82.125,

                    ),
                    child: Text("Over View",
                      style: GoogleFonts.mulish(color: Color(0xff252733),
                        fontSize:Checkbox.width/56.91,
                        fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(height:height/65.7,),
              

              Row(
                children: [

                  //card design1
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                    child:
                    Container(
                      height: height/4.69,
                      width: width/4.017,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors:[Color(0xff6BAAFC),Color(0xff305FEC)])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  margin: EdgeInsets.only(
                                      left:width/136.6,
                                      top: height/65.7
                                  ),
                                  child: SvgPicture.asset("assets/Vector.svg",
                                    height:height/13.14,
                                    width: width/27.32,
                                    color: Colors.white,
                                  )
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Shipped orders",style: GoogleFonts.poppins(
                                        fontSize:width/75.88,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),),
                                    Container(
                                      child: Text("09",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                            fontSize: width/22.76),),
                                      margin: EdgeInsets.only(right: width/68.3),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(
                                  top: height/32.85,
                                  right:width/68.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  //card design2
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                    child: Container(
                      height: height/4.69,
                      width: width/4.017,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors:[Color(0xffEF5E7A),Color(0xffD35385)])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  margin: EdgeInsets.only(left:10,top: 10),
                                  child: SvgPicture.asset("assets/Vector.svg",
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  )
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Pending orders",style: GoogleFonts.poppins(fontSize: 18,
                                        fontWeight: FontWeight.w700,color: Colors.white),),
                                    Container(
                                      child: Text("09",style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,fontSize: 60),),
                                      margin: EdgeInsets.only(right: 20),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(top: 20,right: 20,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  //card design3
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                    child: Container(
                      height: height/4.69,
                      width: width/4.017,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors:[Color(0xffD623FE),Color(0xffA530F2)])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  margin: EdgeInsets.only(left:10,top: 10),
                                  child: SvgPicture.asset("assets/Vector.svg",
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  )
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text("New orders",style: GoogleFonts.poppins(fontSize: 18,
                                        fontWeight: FontWeight.w700,color: Colors.white),),
                                    Container(
                                      child: Text("09",style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,fontSize: 60),),
                                      margin: EdgeInsets.only(right: 20),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(top: 20,right: 20,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height:height/16.425),
              //new orders container
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //card-1
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(15) ),
                    child: Container(
                      height: height/1.79,
                      width: width/2.75,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          //text orders
                          Row(
                            children: [
                              SizedBox(width: width/136.6,),

                              Padding(
                                padding:  EdgeInsets.only(
                                    left: width/170.25,
                                    top: height/25.26
                                ),
                                child: Text("New Orders",style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,color: Color(0xff252733)),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: width/136.6,),
                              Container(
                                margin: EdgeInsets.only(left: width/170.25,),
                                child: Text("Orders placed today or yesterday",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,color: Color(0xff9FA2B4)),),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20,
                                bottom:10),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection("Orders").orderBy("timestamp",descending: true).snapshots(),
                              builder: (context,snapshot) {
                                if(snapshot.hasData==null){
                                  return Container();
                                }
                                if(!snapshot.hasData){
                                  return Container();
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context,index){
                                      var val = snapshot.data!.docs[index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: width/136.6,),

                                          //radio button
                                          Radio(
                                              value: 1,
                                              activeColor: Color(0xff263646),
                                              groupValue:selectedvalue,
                                              onChanged:(value){
                                                setState(() {
                                                  value=selectedvalue;
                                                  selectedvalue=1;
                                                  selectedvalue2=0;
                                                  selectedvalue3=0;
                                                  selectedvalue4=0;
                                                });
                                              }),
                                          //text1
                                          Text("Order ID : ${val["orderid"]} ",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 14),),
                                          Text("- by ${val["name"]} ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.grey),),

                                          SizedBox(width:width/15.87),
                                          val["status"]=="ordered"?

                                          Container(
                                            height: height/27.37,
                                            width: width/25.29,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Color(0xff29CC97)
                                            ),
                                            child: Center(child:
                                            Text("New",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),)),
                                          ) : Container()

                                        ],
                                      ),
                                      Divider(),



                                    ],);
                                });
                              }
                            ),
                          ),


                          TextButton(onPressed: (){
                           setState(() {
                             select=1;
                           });
                          }, child:Text("View More",style: GoogleFonts.poppins(
                              color: Color(0xff3751FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),))

                        ],
                      ),
                    ),
                  ),


                  SizedBox(width:width/34.15),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //card 2
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: height/1.79,
                          width: width/2.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 29,top: 12,),
                                child: Text("New users",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,color: Color(0xff252733)),),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 29),
                                    child: Text("Connect to new users for to increase sales",style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,color: Color(0xff9FA2B4)),),
                                  ),
                                ],
                              ),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection("Users").orderBy("timestamp",descending: true).snapshots(),
                                  
                                  builder: (context,snap){
                                    if(snap.hasData==null){
                                      return Container();
                                    }
                                    if(!snap.hasData){
                                      return Container();
                                    }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    itemBuilder: (context,index){
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 29,top: 20,bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${snap.data!.docs[index]["name"]}",style: GoogleFonts.poppins(color: Color(0xff252733),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),),


                                                Container(
                                                  margin: EdgeInsets.only(right: 29),
                                                  child: Text('- ${snap.data!.docs[index]["address"]}',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,
                                                      color: Color(0xff9FA2B4)
                                                  ),),
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                        ],
                                      );

                                    },

                                  );
                                
                              }),

                              Center(
                                child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        setState(() {
                                          select=2;
                                        });
                                      });
                                  print("view more");
                                }, child: Text("View more..",style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff3751FF),
                                  fontWeight: FontWeight.w600
                                ),)),
                              )
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height:height/16.425,),

                      //card 3

                    ],
                  )
                ],
              )



            ],
          ),
        ),
      ) : select==1?
      SlideInRight(
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
                              onTap: (){
                                setState(() {
                                  select=0;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back_ios_new_rounded),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8,top: 32,bottom: 32),
                              child: Text("Current Orders",style: GoogleFonts.mulish(fontSize: 19,
                                color: Color(0xff252733),
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                            /*  GestureDetector(
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

                           */
                          ],

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
                                      return  Column(
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
      ) :
      SlideInRight(
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
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            select=0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8,top: 32,bottom: 32),
                        child: Text("Users List",style: GoogleFonts.mulish(fontSize: 19,
                          color: Color(0xff252733),
                          fontWeight: FontWeight.w700,
                        ),),
                      ),

                    ],

                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10, right: 5, left: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                          width: width/1.817,
                                          margin: const EdgeInsets.only(bottom: 10, right: 0, left: 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(9),

                                             color: Colors.white,
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
      )

    );
  }
}
