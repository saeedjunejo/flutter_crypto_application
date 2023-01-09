import 'package:air_pay/screen/Navi_screen%20/graph_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginEmailVer extends StatelessWidget {
  const LoginEmailVer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return LoginEmailVer();
            }else{
              return HomePage();
            }
          }

      )
  );
}

