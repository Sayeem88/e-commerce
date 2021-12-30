import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottom_nav/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            //To support the following, you need to use the first initialization method
              button: TextStyle(fontSize: 45.sp)
          ),
        ),
        home:SplashScreen(),
      ),
    );
  }
}


