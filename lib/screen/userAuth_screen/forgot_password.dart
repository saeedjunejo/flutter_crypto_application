import 'package:air_pay/screen/userAuth_screen/login_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email= TextEditingController();
  Future _resetPassword() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=>Center(child: CircularProgressIndicator(),)
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFF1E272E),
        content: Text("Password Reset Send Your Email",
            style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
      ));
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch(e){
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFF1E272E),
        content: Text("Enter All Fields",
            style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
      ));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));



    }

  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            SizedBox(height: 30),
            Align(
              alignment: FractionalOffset.topRight,
              child: InkWell(onTap: (){Get.back();},
                child: Icon(Icons.close,color: Colors.white),
              )
            ),
            Text("Forgot Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            CustomEditedFiled(
              width: Get.width*0.85,
              height: Get.height*0.08,
              hintText: 'Enter your Email',
              controller: email,
            ),
            SizedBox(height: 30),
            CustomButton(
              height: Get.height * 0.08,
              width: Get.width*0.85,
              text: 'Continue',
              fontSize: Get.height * 0.025,
              onPressed: () {
                _resetPassword();
              },
            ),



          ],
        ),
      )

    );
  }
}
