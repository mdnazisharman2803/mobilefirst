import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {

    super.initState();
    Timer(
      Duration(seconds: 7), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 160,),

          Row(
            children: [
              Image.asset("assets/icons.jpg", height: 450.0,
                width: 400.0,),
            ],
          ),
          SizedBox(height: 70,),
          Row(
            children: [
              SizedBox(width: 110,),
              Text(" Made With ", style: TextStyle(color: Color(0xFF929794), fontSize: 14),),
              Text(" Flutter ", style: TextStyle(color: Color(0xFF929794), fontSize: 14),),
            ],
          ),
          SizedBox(height: 20,),
          Row(children: [
            SizedBox(width: 160,),
            Text("By Nazish", style: TextStyle(color: Colors.white, fontSize: 15, decoration: TextDecoration.underline),)
          ],)

        ],
      ),
    );
  }
}