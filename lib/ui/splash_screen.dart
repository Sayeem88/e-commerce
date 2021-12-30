import 'dart:async';

import 'package:e_commerce/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 8), ()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h,),
            Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent
              ),
              child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_eqCI4X.json'),
            ),
            SizedBox(height: 30.h,),
            Center(
              child: Text('Smart \nDoctor',style: TextStyle(color: Color(0xFF16E1B8),fontSize: 40.sp,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15.h,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
