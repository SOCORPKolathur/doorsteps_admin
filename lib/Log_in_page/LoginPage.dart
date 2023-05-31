
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Slider/Slider_x_page.dart';


class Dashboard_Page extends StatefulWidget {
  const Dashboard_Page({Key? key}) : super(key: key);

  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xff263646),
      body:Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 15,
          color: Color(0xffE5E5E5),
          child: Container(
            height: height/1.095,
            width: width/3.415,
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                //app logo images
                Container(
                  height:height/4.38,
                  width: width/9.10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/logo.png"))
                  ),
                ),
                
                //Text 1
                Text("Log in to Admin",style: GoogleFonts.mulish(fontSize: 24,fontWeight: FontWeight.w700),),

                //Text 2
                Text("Dashboard",style: GoogleFonts.mulish(fontSize: 24,fontWeight: FontWeight.w700),),
                
                SizedBox(height: 10,),
                //text3 email and password
                Text("Enter your email and password below",style: GoogleFonts.mulish(color: Color(0xff9FA2B4),fontWeight: FontWeight.w400),),
                //email text and text field
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email",style: GoogleFonts.mulish(color: Color(0xff9FA2B4),fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
                //textfiels email
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email address",
                      hintStyle: GoogleFonts.mulish(color: Color(0xff9FA2B4),fontWeight: FontWeight.w400)),

                  ),
                ),

                //password text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Password",style: GoogleFonts.mulish(color: Color(0xff9FA2B4),fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Forget Password ?",style: GoogleFonts.mulish(color: Color(0xff9FA2B4)),),
                    ),

                  ],
                ),

                //password textfield

                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: IconButton(onPressed: (){}, icon:Icon(Icons.remove_red_eye_outlined,)),
                        hintStyle: GoogleFonts.mulish(color: Color(0xff9FA2B4),fontWeight: FontWeight.w400)),

                  ),
                ),
                
                //log in Button
                GestureDetector(
                  onTap: (){
                    print("Log ion button");
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Slider_Page(),));
                  },
                  child: Container(
                    height: height/13.14,
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff3751FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text("Log in",
                          style: GoogleFonts.mulish(
                              color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
