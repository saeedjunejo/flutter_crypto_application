import 'dart:async';

import 'package:air_pay/screen/Navi_screen%20/graph_screen.dart';
import 'package:air_pay/screen/userAuth_screen/login_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginEmailVer extends StatefulWidget {
  const LoginEmailVer({Key? key}) : super(key: key);

  @override
  State<LoginEmailVer> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<LoginEmailVer> {
  bool isEmailVerified=false;
  bool canResentEmail= false;
  Timer? timer;


  @override
  void initState() {
    super.initState();
    isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified){
      //sendVerificationEmail();
      timer= Timer.periodic(Duration(seconds: 3), (_)=>checkEmailVerified(),);

    }
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified()async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified)timer?.cancel();

  }

  // Future sendVerificationEmail()async{
  //   try {
  //     final user = FirebaseAuth.instance.currentUser!;
  //     await user.sendEmailVerification();
  //
  //     setState(() =>canResentEmail=false);
  //     await Future.delayed(Duration(seconds: 5));
  //     setState(() =>canResentEmail=true);
  //
  //
  //   }catch(e){
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Color(0xFF1E272E),
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) => isEmailVerified ? LoginScreen():
  Scaffold(
    backgroundColor: customBlack,
    body:  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please Verified a Email then Login.',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          SizedBox(height: 20),

          // ElevatedButton.icon(
          //     style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          //     icon: Icon(Icons.email,size: 32),
          //     label: Text('Resent Email',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          //     onPressed: canResentEmail ? sendVerificationEmail : null),


          TextButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),

            child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
            onPressed: ()=>FirebaseAuth.instance.signOut(),
          )



        ],
      ),
    ),

  );

}
