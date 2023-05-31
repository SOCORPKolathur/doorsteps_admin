import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Log_in_page/LoginPage.dart';
import 'Slider/Slider_x_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: "AIzaSyDne-NOFTAjebgJugf4BsoIgq8P1qofAq8",
          authDomain: "door-steps-1780c.firebaseapp.com",
          projectId: "door-steps-1780c",
          storageBucket: "door-steps-1780c.appspot.com",
          messagingSenderId: "620465120662",
          appId: "1:620465120662:web:759223b3997a2fdf98e9b7",
          measurementId: "G-9Z1T5LHGRX"
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isVisible = true;
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  static const snackBar = SnackBar(
    content: Text('Oops! Invalid Password,Try again...'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            width: double.infinity,
            child: Image.network("assets/loginbg.png",fit: BoxFit.cover,)),


        Padding(
          padding: const EdgeInsets.only(left: 808.0,top: 60),
          child: Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.75),
            ),

            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: .0),
                        child: Text(
                          "Welcome to ",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Text("Door Steps Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff779341),fontSize: 18)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 160,top: 20),
                    child: Text("Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top:25.0, right: 50,bottom: 10),
                    child: Text(
                      "Enter your ADMIN ID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 0.0,top: 10),
                    child: Container(
                      // color: Colors.grey,
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.grey,),borderRadius: BorderRadius.circular(12)
                      ),
                      child: TextField(
                        controller: name,

                        decoration: InputDecoration(contentPadding:EdgeInsets.only(left:29),
                            border: InputBorder.none,
                            hintText:
                            "Admin ID"),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,right: 150,bottom: 6),
                    child: Text("Enter your Password",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 0.0,top: 10),
                    child: Container(
                      //color: Colors.grey[50],
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(12)
                      ),
                      child: TextField(
                        controller: password,
                        obscureText: isVisible,
                        decoration: InputDecoration(contentPadding:EdgeInsets.only(left:29,top: 15),
                            border: InputBorder.none,
                            hintText:
                            "Password",

                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible ? Icons.visibility: Icons.visibility_off,
                              color: Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),),
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,),
                    child: GestureDetector(onTap: () {
                      if(name.text=="demo"&&password.text=="demo@123"){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> Slider_Page())
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                      child: Container(child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white),)),
                        // color: Color(0xff00A0E3),
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration( color: Color(0xff779341),
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
