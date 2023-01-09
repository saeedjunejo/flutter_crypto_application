import 'package:air_pay/screen/userAuth_screen/login_screen.dart';
import 'package:air_pay/screen/userAuth_screen/main_page.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final fName= TextEditingController();
  final lName= TextEditingController();
  final mobile= TextEditingController();
  final email= TextEditingController();
  final pass =TextEditingController();

  final SignUpController signUpController = Get.put(SignUpController());





  Future signUp() async {

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());

      FirebaseFirestore.instance.collection("UserData").add({
        "FirstName":fName.text,
        "LastName":lName.text,
        "MobileName":mobile.text,
        "EmailAddress":email.text,

      });

      Fluttertoast.showToast(
          msg: "Sign Up Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));



    }on FirebaseAuthException  catch(e){

      Fluttertoast.showToast(
          msg: "Email Already Exist",
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
      backgroundColor: customBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 50),

          Center(child: SvgPicture.asset("assets/icons/logo.svg")),
          SizedBox(height: 20),
          Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          Text("Pay Your Way",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
          SizedBox(height: 20),


          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        CustomEditedFiled(
                          width: size.width*0.85,
                          height: size.height*0.08,
                          hintText: 'First Name',
                          controller: fName,
                        ),
                        SizedBox(height: 15),

                        CustomEditedFiled(
                          width: size.width*0.85,
                          height: size.height*0.08,
                          hintText: 'Last Name',
                          controller: lName,
                        ),

                        SizedBox(height: 15),

                        CustomEditedFiled(
                          width: size.width*0.85,
                          height: size.height*0.08,
                          hintText: 'Email Address',
                          controller: email,
                        ),

                        SizedBox(height: 15),

                        CustomEditedFiled(
                          width: size.width*0.85,
                          height: size.height*0.08,
                          hintText: 'Mobile',
                          controller: mobile,
                        ),

                        SizedBox(height: 15),

                        CustomPassField(
                          hintText: '*********',
                          controller: pass,
                          signupController: signUpController
                        ),
                        SizedBox(height: 40),
                        CustomButton(
                          height: size.height * 0.08,
                          width: size.width*0.85,
                          text: 'Sign Up',
                          fontSize: Get.height * 0.025,
                          onPressed: () {

                            if(fName.text.isEmpty||lName.text.isEmpty||mobile.text.isEmpty||email.text.isEmpty||pass.text.isEmpty){

                              Fluttertoast.showToast(
                                  msg: "Please Enter All Filed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color(0xFF1E272E),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }else if(!email.text.contains('@')||!email.text.contains('.com')){

                            }
                            signUp();

                            },
                        ),

                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              child: Text("Sign In",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20)),
                            )

                          ],),
                        SizedBox(height: 20),


                      ]))),
        ],
      ),
    );
  }
}
