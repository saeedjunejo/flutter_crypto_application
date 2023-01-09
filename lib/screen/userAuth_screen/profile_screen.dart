import 'package:air_pay/screen/userAuth_screen/login_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../Navi_screen /setting/setting_screen.dart';
import '../Navi_screen /transcation_screen/check_status.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fName=TextEditingController();
  final lName=TextEditingController();
  final email=TextEditingController();
  final mobile=TextEditingController();
  bool updateProfile=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: customBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
          width: Get.width,
          height: Get.height*0.45,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF373F45), Color(0xFF171E30)],
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)
            )

        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Icon(Icons.arrow_back,color: Colors.white),
                ),
              ),
              Center(child: Text("My Profile",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
              SizedBox(height: 20),
              Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF191919),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset("assets/icons/avatar.svg",color: Colors.white30),
                    )
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GlassmorphicContainer(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  borderRadius: 20,
                  blur: 7,
                  alignment: Alignment.center,
                  border: 0,
                  linearGradient: LinearGradient(colors: [Colors.white.withAlpha(45), Colors.white.withAlpha(55)],),
                  borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                  child: CustomButton(
                    height: Get.height * 0.07,
                    width: Get.width*0.65,
                    text: 'Logout',
                    fontSize: Get.height * 0.018,
                    onPressed: () {
                      showAlertLogout(context);


                    },
                  ),

                ),
              ),
              SizedBox(height: 10),
            ],
          ),



        ),

          //SizedBox(height: 30),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                InkWell(
                  onTap: (){
                    setState(() {
                      updateProfile=!updateProfile;});
                  },
                  child:  Container(
                    width: Get.width*0.93,
                    height: Get.height*0.09,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF373F45), Color(0xFF171E30)],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      //color: Colors.yellow

                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        SvgPicture.asset("assets/icons/avatar.svg",color: Colors.white30,width: 25,height: 25),
                        SizedBox(width: 10),
                        Text("Update Profile",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                updateProfile?updatePro():

                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckTransStatus()));
                  },
                  child:  Container(
                    width: Get.width*0.93,
                    height: Get.height*0.09,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF373F45), Color(0xFF171E30)],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      //color: Colors.yellow

                    ),
                    child:  Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset("assets/icons/check.png",width: 25,height: 25,),
                        SizedBox(width: 10),
                        Text("Transaction Status",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),


                      ],
                    ),
                  ),
                ),


                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    showAlertSupport(context);
                  },
                  child:  Container(
                    width: Get.width*0.93,
                    height: Get.height*0.09,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF373F45), Color(0xFF171E30)],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      //color: Colors.yellow

                    ),
                    child:  Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset("assets/icons/callback.png",width: 25,height: 25,),
                        SizedBox(width: 20),
                        Text("Support Desk",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ))





        ],
      ),
    );
  }

  showAlertLogout(BuildContext context) {

    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xFF373F45),
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 20,right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: Get.width*0.35,
              height: Get.height*0.18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/exitlogout.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 40),
            Text("Please confirm",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Are you sure  want to logout the app?",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400,fontSize: 15), textAlign: TextAlign.center),
            SizedBox(height: 20),
            CustomButton(
              height: Get.height * 0.075,
              width: Get.width*0.65,
              text: 'Logout',
              fontSize: Get.height * 0.025,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
            ),
            SizedBox(height: 20),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.65,
              text: 'Cancel',
              fontSize: Get.height * 0.020,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 10),


          ],
        )

      ],

    );



    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }

  showAlertSupport(BuildContext context) {

    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xFF373F45),
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 20,right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: Get.width*0.25,
              height: Get.height*0.15,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/callback.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 40),
            Text("Support Desk",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Need any query please feel\n free to contact us?",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400,fontSize: 15), textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text("info@airpay.com",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),

            // CustomButton(
            //   height: Get.height * 0.075,
            //   width: Get.width*0.65,
            //   text: 'Logout',
            //   fontSize: Get.height * 0.025,
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            //   },
            // ),
            SizedBox(height: 20),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.65,
              text: 'Cancel',
              fontSize: Get.height * 0.020,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 10),


          ],
        )

      ],

    );



    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }

  Widget updatePro(){
    return Column(
      children: [
        SizedBox(height: 30),
        CustomEditedUser(
          width: Get.width*0.93,
          height: Get.height*0.08,
          hintText: "Air",
          controller: fName,
          onPressed: (){
            if(fName.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Please Edit First Name",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }else{
              final docuUpdate =FirebaseFirestore.instance.collection('UserData').doc('IN37pdxTS1BDspSnHKeC');
              docuUpdate.update({
                'FirstName': fName.text.toString()

              });
              Fluttertoast.showToast(
                  msg: "Successfully Update",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
          },
        ),

        SizedBox(height: 20),
        CustomEditedUser(
          width: Get.width*0.93,
          height: Get.height*0.08,
          hintText: "Pay",
          controller: lName,
          onPressed: (){

            if(lName.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Please Edit Last Name",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }else{
              final docuUpdate =FirebaseFirestore.instance.collection('UserData').doc('IN37pdxTS1BDspSnHKeC');
              docuUpdate.update({
                'FirstName': lName.text.toString()

              });
              Fluttertoast.showToast(
                  msg: "Successfully Update",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }

          },
        ),

        SizedBox(height: 20),
        CustomEditedUser(
          width: Get.width*0.93,
          height: Get.height*0.08,
          hintText: "airpay@gmail.com",
          controller: email,
          onPressed: () {
            if(email.text.isEmpty || !email.text.contains('@')||!email.text.contains('.com')){
              Fluttertoast.showToast(
                  msg: "Please correct email",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }else{
              final docuUpdate =FirebaseFirestore.instance.collection('UserData').doc('IN37pdxTS1BDspSnHKeC');
              docuUpdate.update({
                'FirstName': email.text.toString()

              });
              Fluttertoast.showToast(
                  msg: "Successfully Update",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }


          },
        ),

        SizedBox(height: 20),
        CustomEditedUser(
          width: Get.width*0.93,
          height: Get.height*0.08,
          hintText: "+44 5678946789",
          controller: mobile,
          onPressed: (){

            if(mobile.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Please Edit Mobile",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }else{
              final docuUpdate =FirebaseFirestore.instance.collection('UserData').doc('IN37pdxTS1BDspSnHKeC');docuUpdate.update({
                'FirstName': mobile.text.toString()

              });
              Fluttertoast.showToast(
                  msg: "Successfully Update",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF1E272E),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }

          },
        ),
        SizedBox(height: 20)

      ],
    );
  }

}





