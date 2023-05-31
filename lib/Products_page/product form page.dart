
import 'dart:html';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
class FormPage extends StatefulWidget {

  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with TickerProviderStateMixin{

  String dropdownValue = list.first;
  final TextEditingController firstnamefield=TextEditingController();
  final TextEditingController middlenamefield=TextEditingController();
  final TextEditingController lastnamefield=TextEditingController();
  final TextEditingController jobfield=TextEditingController();
  final TextEditingController mobilefield=TextEditingController();
  final TextEditingController emailfield=TextEditingController();
  final TextEditingController sexfield=TextEditingController();
  final TextEditingController dobfield=TextEditingController();

  var dates;
  var candidate;
  var stage;
  var role;
  var contact;
  var viewcandidate;
  var pages;
  int n=0;


  String imgUrl="";
  String fileName = Uuid().v1();

  uploadToStorage() async{

    InputElement input = FileUploadInputElement()as InputElement ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('sliderimages').child("${file.name}").putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
        update(imgUrl);
        print(imgUrl);
      });
    });

    print(imgUrl);

  }
  update(url) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('slider').doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
      "urls": url,
      'timestamp':DateTime.now().microsecondsSinceEpoch

    });
  }



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;

    return Scaffold(
        body:
        SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              //add employee text and design
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Add New HR / Employee',style: GoogleFonts.inter(
                        fontSize:width/56.91,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                  ],
                ),
              ),

              SizedBox(height:height/13.14),

              Center(
                child:
                Material(
                  color: Colors.white38,
                  surfaceTintColor: Color(0xff0B014B) ,
                  shadowColor: Color(0xff0B014B),
                  elevation: 15,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width:width/1.39,
                    height: height/1.02,
                    child:
                    Padding(
                      padding:EdgeInsets.only(
                          left:width/68.3,
                          right: width/68.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:height/13.14),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [

                              //dropdown design
                              Card(
                                elevation: 2,
                                child: Container(

                                  margin: EdgeInsets.only(left: width/68.3),

                                  width:width/7.00,
                                  child:
                                  DropdownButton<String>(
                                   isExpanded: true,
                                    value: dropdownValue,
                                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                                    elevation: 16,
                                    underline: SizedBox(),
                                    style:GoogleFonts.inter(color: Colors.black,),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
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
                                  Container(
                                    decoration: BoxDecoration(
                                        color:Color(0xff808080),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    width:width/13.66,
                                    height:height/15.64,
                                    child: Center(child: Text('Cancel',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                          color: Colors.white
                                    ),)),
                                  ),

                                  SizedBox(width:width/32.85),

                                  //save button design
                                  Container(
                                    decoration: BoxDecoration(
                                        color:Color(0xff109CF1),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    width:width/13.66,
                                    height:height/15.64,
                                    child: Center(child: Text('Save',style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,color: Colors.white
                                    ),)),
                                  ),

                                ],),
                            ],
                          ),

                          SizedBox(height:height/32.85),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //product name text
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Name*',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize:width/97.57)),

                                    SizedBox(height:height/82.12,),

                                    Container(
                                        height:height/16.42,
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: firstnamefield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(
                                                    top:height/60,
                                                    left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                              SizedBox(width:width/46.65,),

                              //stock availalble text
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stocks Available',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,
                                    )),

                                    SizedBox(height:height/82.12,),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: middlenamefield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(
                                                    top:height/60,
                                                    left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                              SizedBox(width:width/46.65,),

                              //price text
                              Container(
                                width:width/8.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,)),

                                    SizedBox(height:height/131.4,),


                                    Container(
                                        height:height/16.42,
                                        width: width/13.66,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: lastnamefield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                              SizedBox(width:width/46.65,),

                              //offer text
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Offer Price',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,)),

                                    SizedBox(height:height/65.7),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: lastnamefield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height:height/32.85),

                          //product des text
                          Row(
                            children: [
                              Container(
                                width: width/1.51,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Description',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,)),

                                    SizedBox(height:height/131.4,),

                                    Container(
                                        height: height/6.98,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(5),),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: jobfield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height:height/32.85),


                          //brand and sold by text
                          Row(
                            children: [
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Brand',style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:width/97.57)),

                                    SizedBox(height:height/131.4),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child:TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: sexfield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(width:width/46.65,),
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sold By',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,
                                    )),

                                    SizedBox(height:height/131.4),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:  BorderRadius.circular(5),
                                          elevation: 2,
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: dobfield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height:height/32.85),

                          //code and price text
                          Row(
                            children: [
                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Code',style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:width/97.57,)),

                                    SizedBox(height:height/131.4),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,),
                                        child: Material(
                                          color: Colors.white,
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(5),
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: mobilefield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),


                              SizedBox(width:width/45.53),


                              Container(
                                width:width/6.22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price 2',style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                        fontSize:width/97.57,
                                    )),
                                    SizedBox(height:height/131.4,),

                                    Container(
                                        height:height/16.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,),
                                        child: Material(
                                          color: Colors.white,
                                          elevation:2,
                                          borderRadius:  BorderRadius.circular(5),
                                          child: TextFormField(
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: width/110,
                                              fontWeight: FontWeight.w500,),
                                            controller: emailfield,
                                            cursorColor: Color(0xff5138EE),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(
                                                    top:height/60,
                                                    left: width/186.6)
                                            ),),
                                        )),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height:height/32.85),

                          //upload dotted designs
                          Row(
                            children: [
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                dashPattern: [5,5],
                                color: Color(0xff5138EE),
                                strokeWidth:2, child: Container(
                                  width:width/6.22,
                                  height:height/8.69,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height:height/104.3,),
                                      Icon(Icons.upload_file,color:Color(0xff5138EE),
                                        size: width/46.65,),
                                      SizedBox(height:height/104.3,),
                                      Text('Select the Main Image to Upload',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize:width/124.4,
                                              color: Color(0xff0B014B)))
                                    ],)
                              ),
                              ),

                              SizedBox(width: width/68.3,),

                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                dashPattern: [5,5],
                                color: Color(0xff5138EE),
                                strokeWidth:2, child: Container(
                                  width:width/6.22,
                                  height:height/8.69,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height:height/104.3,),
                                      Icon(Icons.upload_file,color:Color(0xff5138EE),size: width/46.65,),
                                      SizedBox(height:height/104.3,),
                                      Text('Select the second image to Upload',style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontSize:width/124.4,
                                          color: Color(0xff0B014B)))
                                    ],)
                              ),
                              ),

                              SizedBox(width: width/68.3,),


                              GestureDetector(
                                onTap: (){
                                  print("select the file");
                                  uploadToStorage();
                                },
                                child: Container(
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10),
                                    dashPattern: [5,5],
                                    color: Color(0xff5138EE),
                                    strokeWidth:2, child: Container(
                                      width:width/6.22,
                                      height:height/8.69,
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height:height/104.3,),
                                          Icon(Icons.upload_file,color:Color(0xff5138EE),
                                            size: width/46.65,),
                                          SizedBox(height:height/104.3,),
                                          Text('Select the third Image to Upload',style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize:width/124.4,
                                              color: Color(0xff0B014B)))
                                        ],)
                                  ),
                                  ),
                                ),
                              ),
                            ],),
                          SizedBox(height:height/32.85),
                        ],),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


}


