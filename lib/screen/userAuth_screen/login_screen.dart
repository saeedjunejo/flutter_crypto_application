import 'package:air_pay/screen/userAuth_screen/forgot_password.dart';
import 'package:air_pay/screen/userAuth_screen/register_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../Navi_screen /graph_screen.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email= TextEditingController();
  final pass =TextEditingController();
  final SignUpController signUpController = Get.put(SignUpController());

  Future signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: pass.text.trim());
      Fluttertoast.showToast(
          msg: "Sign In Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage()
          //LoginEmailVer()

      ));

    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(
          msg: "Invalid Email & password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: customBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 80),
            Center(child: SvgPicture.asset("assets/icons/logo.svg")),
            SizedBox(height: 50),
            Text("Hello !",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Text("Pay Your Way",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
            SizedBox(height: 30),
            CustomEditedFiled(
              width: size.width*0.85,
              height: size.height*0.08,
              hintText: 'Enter your Email',
              controller: email,
            ),
            SizedBox(height: 15),
            CustomPassField(
              hintText: '*********',
              controller: pass,
              signupController: signUpController,
            ),
            SizedBox(height: 10),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword()));

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: Align(
                    alignment: FractionalOffset.topRight,
                    child: Text("Forgot Password?",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                  ),
                )
            ),

            SizedBox(height: 30),
            CustomButton(
              height: size.height * 0.08,
              width: size.width*0.85,
              text: 'Sign In',
              fontSize: Get.height * 0.025,
              onPressed: () {
                if (email.text.isEmpty||pass.text.isEmpty){

                  Fluttertoast.showToast(
                    msg: "Enter all filed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color(0xFF1E272E),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }else if(!email.text.contains('@')||!email.text.contains('.com')){
                }
                signIn();


              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20)),
                )

              ],),




          ],
        )
      )






    );
  }
}
