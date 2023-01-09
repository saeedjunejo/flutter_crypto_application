import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web3_connect/web3_connect.dart';
import '../../../utils/components.dart';

// class MetamaskLogin extends StatefulWidget {
//   const MetamaskLogin({Key? key}) : super(key: key);
//
//   @override
//   State<MetamaskLogin> createState() => _MetamaskLoginState();
// }
//
// class _MetamaskLoginState extends State<MetamaskLogin> {
//   Web3Connect connection = Web3Connect();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login Page")),
//       body: Center(
//           child: ElevatedButton(
//             child: const Text("Log In"),
//             onPressed: () async {
//               await connection.connect();
//
//               if (connection.account != "") {
//                 Navigator.push(context, MaterialPageRoute(builder: ((context) => Home(connection: connection))));
//               }
//
//             },
//           )),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key, required this.connection}) : super(key: key);
  final Web3Connect connection;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool killed = false;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7),()=>Navigator.pop(context));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      appBar: AppBar(
        backgroundColor: customBlack,
        title: Text("Metamask Wallet",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: Text(widget.connection.account,style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20))),
          SizedBox(height: 40),

          CustomButton(
            height: Get.height * 0.075,
            width: Get.width*0.75,
            text: 'Disconnect',
            fontSize: Get.height * 0.025,
            onPressed: () async {
              await widget.connection.disconnect();
              setState(() {
                killed = true;
              });
            },

          ),
          SizedBox(height: 40),
          killed ? Text("Metamask Wallet Disconnected", style: TextStyle(color: Colors.red,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20))
              : Text(" Metamask Wallet Connected",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20)),
        ],
      ),
    );
  }
}