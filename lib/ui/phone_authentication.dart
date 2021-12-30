import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/registration_screen.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController phoneController=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;

  phoneAuth() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      timeout: Duration(seconds: 40),
      verificationCompleted: (PhoneAuthCredential credential) async{
        var result=await _auth.signInWithCredential(credential);
        User? user = result.user;
        // if(user!=null){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen())
        //   );
        // }
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));

      },
      verificationFailed: (FirebaseAuthException exception){
        print(exception);
      },
      codeSent: (String verificationId,int? resendToken){

      },
      codeAutoRetrievalTimeout: (String verificationId){},
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',


              ),

            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              phoneAuth();
            }, child: Text('Send'))
          ],
        ),
      ),
    );
  }
}
