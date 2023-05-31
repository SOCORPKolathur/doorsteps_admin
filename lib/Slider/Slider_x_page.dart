

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Payment_Page/Payment_Page.dart';
import '../Products_page/Product_page.dart';
import '../Products_page/product form page.dart';
import '../Support_Page/Support_Page.dart';
import '../Users_Page/Users_Page.dart';
import '../dashboard_page/Dashboard_landing_page.dart';
import '../order_page/Order_page_design.dart';
import '../shippin_page/shipping_page.dart';

class Slider_Page extends StatefulWidget {
  const Slider_Page({Key? key}) : super(key: key);

  @override
  State<Slider_Page> createState() => _Slider_PageState();
}

class _Slider_PageState extends State<Slider_Page> {

  int select=0;
  var page1=Payment_Page();
  var page2=FormPage();

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width/5.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child:SidebarX(
               
                extendedTheme:SidebarXTheme(),
                showToggleButton: false,
                headerBuilder: (context, extended) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(

                              child: Icon(Icons.admin_panel_settings,size: 40,color: Colors.white,),

                              decoration: BoxDecoration(

                              ),
                            ),
                            SizedBox(width: 5,),
                            
                            Text("Admin Dashboard",style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w700
                            ),)
                          ],
                        ),
                      ),
                    ],
                  );
                },
                theme: SidebarXTheme(
                  iconTheme:IconThemeData(
                    color: Colors.white
                  ),
                  hoverColor: Color(0xff9FA2B4),
                  itemMargin: EdgeInsets.all(20),
                    itemTextPadding: EdgeInsets.only(left: 20),
                    selectedItemPadding:EdgeInsets.all( 20),
                    selectedItemTextPadding:EdgeInsets.only(left: 20),
                    selectedItemDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),

                    ),

                    selectedIconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    selectedTextStyle: GoogleFonts.mulish(color:Colors.black),

                    textStyle: GoogleFonts.poppins(
                      color: Color(0xffA7B7DD),),
                  decoration: BoxDecoration(
                    color: Color(0xff363740)
                  ),
                  itemPadding: EdgeInsets.only(right: 20)
                ),
                controller:SidebarXController(
                    selectedIndex: select,extended: true),
                items: [
                  SidebarXItem(
                    onTap: (){
                      setState(() {
                        select=0;
                      });
                    },
                    icon: Icons.pie_chart,
                    label: "Over View"
                  ),

                  SidebarXItem(
                      icon: Icons.shopping_cart_rounded,
                      label: "Orders",
                    onTap: (){
                        setState(() {
                          select=1;
                        });
                    }
                  ),

                  SidebarXItem(
                      icon: Icons.fire_truck_rounded,
                      label: "Shipped Orders",
                    onTap: (){
                        setState(() {
                          select=2;
                        });
                    }
                  ),

                  SidebarXItem(
                      icon: Icons.people_alt_rounded,
                      label: "Vendors",
                      onTap: (){
                        setState(() {
                          select=3;
                        });
                      }
                  ),

                  SidebarXItem(
                      icon: Icons.shopping_bag_sharp,
                      label: "Users",
                    onTap: (){
                        setState(() {
                          select=4;
                        });
                    }
                  ),

                  SidebarXItem(
                      icon: Icons.payment,
                      label: "Payments",
                      onTap: (){
                        setState(() {
                          select=5;
                        });
                      }
                  ),

                  SidebarXItem(
                      icon: Icons.payment,
                      label: "Support",
                      onTap: (){
                        setState(() {
                          select=6;
                        });
                      }
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: width/0.81,
              height: height/0.91,
              padding: EdgeInsets.all(5.0),
              child:select==0?Dash_landing_page()
                  :select==1?Order_page():
              select==2?Shippping_Page():
              select==3?Product_Page():
              select==4?Users_Page():
              select==5?Payment_Page():
              select==6?Support_Page():
              Container(),
            ),
          )
        ],
      ),

    );
  }
}
