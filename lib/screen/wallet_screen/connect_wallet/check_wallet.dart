// import 'package:air_pay/utils/color.dart';
// import 'package:flutter/material.dart';
// import 'package:web3dart/web3dart.dart';
//
// class CheckWallet extends StatefulWidget {
//   const CheckWallet({Key? key}) : super(key: key);
//
//   @override
//   State<CheckWallet> createState() => _CheckWalletState();
// }
//
// class _CheckWalletState extends State<CheckWallet> {
//   String _balance = '';
//
//   void _getBalance() async {
//     var apiUrl = "https://ropsten.infura.io/v3/5a0a67f99b224875abe8e15602c50a47";
//
//     var httpClient = Client();
//     var ethClient = Web3Client(apiUrl, httpClient);
//     final balance = await ethClient.getBalance(credentials.address);
//     final wei = balance.getValueInUnitBI(EtherUnit.wei);
//
//     setState(() {
//       _balance = wei.toString();
//     });
//
//     print(wei);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: customBlack,
//       appBar: AppBar(backgroundColor: customBlack),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//
//         ],
//       ),
//     );
//   }
// }


import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../../utils/components.dart';
import '../wallet_screen.dart';





class CheckWallet extends StatefulWidget {
   CheckWallet({Key? key}) : super(key: key);


  @override
  State<CheckWallet> createState() => _CheckWalletState();
}

class _CheckWalletState extends State<CheckWallet> {
  String _balance = '';
  final walletSearch = TextEditingController();


  final credentials = EthPrivateKey.fromHex("0xe4976f4dD4463f38EE1eF8a0d9cDcbdFB4C28DE6");
  //0xe4976f4dD4463f38EE1eF8a0d9cDcbdFB4C28DE6
  void _getBalance() async {
    var apiUrl = "https://ropsten.infura.io/v3/5a0a67f99b224875abe8e15602c50a47";

    var httpClient = Client();
    var ethClient = Web3Client(apiUrl, httpClient);
    final balance = await ethClient.getBalance(credentials.address);
    final wei = balance.getValueInUnitBI(EtherUnit.wei);

    setState(() {
      _balance = wei.toString();
    });

    print(wei);
  }

  

  @override
  Widget build(BuildContext context) {
    //final credentialser = EthPrivateKey.fromHex("${ walletSearch.text.toString()}");
    return Scaffold(
      backgroundColor: customBlack,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[

            SizedBox(height: 40),
            InkWell(
              onTap: (){
               // Get.to(()=>WalletScreen());
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);

              },
              child: Container(
                width: 35,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xFF191919),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.arrow_back,color: Colors.white),
              ),
            ),

            SizedBox(height: 30),
            Center(child: Text("Check any Crypto Wallet Balance",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20))),

            SizedBox(height: 30),
            Center(child: Text('Wallet Address',style: TextStyle(color: Colors.white,fontSize:15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

            SizedBox(height: 30),
            Center(child: Text('${credentials.address}',style: TextStyle(color: Colors.white,fontSize:15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

            SizedBox(height: 50),
            Center(child: Text(_balance,style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),


            SizedBox(height: 50),
            CustomEdited(
              width: Get.width*0.85,
              height: Get.height*0.08,
              hintText: 'Enter Wallet Address',
              controller: walletSearch,
            ),

            SizedBox(height: 50),
            Center(
              child: CustomButton(
                height: Get.height * 0.075,
                width: Get.width*0.85,
                text: 'Check Wallet Balance',
                fontSize: Get.height * 0.025,
                onPressed: _getBalance
              ),
            ),



          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}