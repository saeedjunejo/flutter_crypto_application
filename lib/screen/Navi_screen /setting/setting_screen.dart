import 'package:air_pay/screen/Navi_screen%20/setting/virtual_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:web3_connect/web3_connect.dart';
import '../../../utils/coinModel.dart';
import '../../../utils/coincard.dart';
import '../../../utils/color.dart';
import '../../../utils/components.dart';
import '../../market_screen.dart';
import '../../wallet_screen/connect_metamask/metamask_auth.dart';
import '../../wallet_screen/connect_wallet/check_wallet.dart';
import '../../wallet_screen/connect_wallet/connect_wallet.dart';
import '../transcation_screen/check_status.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Coin> dCoinList = [];
  @override
  initState(){
    dCoinList.addAll(coinList);
    super.initState();
  }



  Web3Connect connection = Web3Connect();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            Text("Settings",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 20),
                      InkWell(
                        onTap: (){
                          showAlertConnectWallet(context);

                        },
                        child: customSetting("assets/icons/check balance.png", "Manage Wallet"),
                      ),

                      SizedBox(height: 25),
                      InkWell(
                        onTap: (){
                          showAlertConnMetamask(context);

                        },
                        child: customSetting("assets/icons/metamask.png", "Metamask Wallet"),
                      ),


                      // SizedBox(height: 25),
                      // InkWell(
                      //   onTap: (){
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckTransStatus()));
                      //
                      //   },
                      //   child: customSetting("assets/icons/check.png", "Transaction Status"),
                      // ),



                      SizedBox(height: 25),

                      InkWell(
                        onTap: (){
                          Get.to(()=>VirtualCard());
                        },
                        child:  Container(
                          width: Get.width*1,
                          height: Get.height*0.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: new LinearGradient(
                              colors: [
                                Color(0xFFee0979),
                                Color(0xFFff6a00),
                              ],),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 25),
                            child: Row(
                              children: [

                                SvgPicture.asset("assets/icons/vircard.svg",width: 30,height: 30),




                                SizedBox(width:10),
                                Text("   Manage Cards",style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)


                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),



                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
  Future bottomSheet(){
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        backgroundColor: customBlack,
        builder: (context){
          return Container(
            height: Get.height*0.38,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text("Check Wallet Balance", textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20)),

                Spacer(),
                CustomButton(
                  height: Get.height * 0.075,
                  width: Get.width*0.75,
                  text: 'Check',
                  fontSize: Get.height * 0.025,
                  onPressed: () {
                    Get.to(()=>CheckWallet());
                  },
                ),

                SizedBox(height: 20),
                CustomButRegister(
                  height: Get.height * 0.07,
                  width: Get.width*0.75,
                  text: 'Cancel',
                  fontSize: Get.height * 0.025,
                  onPressed: () {
                    Get.back();
                  },
                ),

                SizedBox(height: 20),

              ],
            ),
          );
        }
    );
  }
  showAlertConnectWallet(BuildContext context) {

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
            Text("Select Wallet Connect Type",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),

            SizedBox(height: 20),
            GlassmorphicContainer(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                borderRadius: 20,
                blur: 7,
                alignment: Alignment.center,
                border: 0,
                linearGradient: LinearGradient(colors: [Colors.white.withAlpha(50), Colors.white.withAlpha(40)],),
                borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/walletconnect.png",width: 40,height: 40),
                        SizedBox(width: 15),
                        Text("Connect Wallet",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      ],
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      height: Get.height * 0.075,
                      width: Get.width*0.75,
                      text: 'Next',
                      fontSize: Get.height * 0.025,
                      onPressed: () {
                        Get.to(()=>ConnectWallet());
                      },
                    ),
                  ],
                )
            ),

            SizedBox(height: 20),
            GlassmorphicContainer(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                borderRadius: 20,
                blur: 7,
                alignment: Alignment.center,
                border: 0,
                linearGradient: LinearGradient(colors: [Colors.white.withAlpha(50), Colors.white.withAlpha(40)],),
                borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width: 15),
                        Image.asset("assets/icons/check balance.png",width: 40,height: 40),
                        SizedBox(width: 15),
                        Text("Check Wallet Balance",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                        //SizedBox(width: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      height: Get.height * 0.075,
                      width: Get.width*0.75,
                      text: 'Next',
                      fontSize: Get.height * 0.025,
                      onPressed: () {bottomSheet();},
                    ),
                  ],
                )
            ),


            SizedBox(height: 30),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.75,
              text: 'Cancel',
              fontSize: Get.height * 0.025,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 20),

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
  showAlertConnMetamask(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xFF373F45),
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 20,right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              width: Get.width*0.35,
              height: Get.height*0.20 ,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/metamask.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 40),
            Text("Connect Metamask Wallet",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 30),
            CustomButton(
              height: Get.height * 0.075,
              width: Get.width*0.75,
              text: 'Next',
              fontSize: Get.height * 0.025,
              onPressed: () {
                MetamaskBottomSheet();
                //Get.to(()=>MetamaskLogin());
              },
            ),
            SizedBox(height: 25),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.75,
              text: 'Cancel',
              fontSize: Get.height * 0.025,
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
  Future  MetamaskBottomSheet(){
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        backgroundColor: customBlack,
        builder: (context){
          return Container(
            height: Get.height*0.38,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text("You have Metamask Account",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
                Spacer(),

                CustomButton(
                  height: Get.height * 0.075,
                  width: Get.width*0.75,
                  text: 'Connect',
                  fontSize: Get.height * 0.025,
                  onPressed: () async {
                    await connection.connect();
                    Fluttertoast.showToast(
                        msg: "Create Account on Metamask",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xFF1E272E),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    if (connection.account != ""){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Home(connection: connection))));
                    }

                  },
                ),
                SizedBox(height: 20),

                CustomButRegister(
                  height: Get.height * 0.07,
                  width: Get.width*0.75,
                  text: 'Cancel',
                  fontSize: Get.height * 0.025,
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(height: 20),



              ],
            ),
          );
        }
    );
  }




}






Widget customSetting(String image,String title){
  return Container(
    width: Get.width,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF191919),

    ),

    child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(image,width: 30,height: 30,),
                  SizedBox(width: 20),
                  Text(title,style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400,fontSize: 15))

                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined,color: Colors.white)

            ])
    ),
  );



}