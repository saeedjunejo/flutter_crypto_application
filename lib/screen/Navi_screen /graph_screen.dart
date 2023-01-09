import 'package:air_pay/screen/Navi_screen%20/setting/setting_screen.dart';
import 'package:air_pay/screen/wallet_screen/wallet_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../market_screen.dart';
import 'exchange_screen/api_screen/exchange_screen.dart';
import 'transcation_screen/start_exchabnge_screen.dart';
import 'home_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab =0;
  final List<Widget> screens=[

    MyStatefulWidget(),
    MarketScreen(),
    WalletScreen(),
    StartExchangeScreen(),
    SettingScreen(),
  ];

  final PageStorageBucket bucket= PageStorageBucket();
  Widget currentScreen= MyStatefulWidget();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body:
      PageStorage(
        child: currentScreen,
        bucket: bucket,

      ),
        bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 70,
            color: Color(0xFF0c0c0c),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                SizedBox(width: 5),
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen= MyStatefulWidget();
                        currentTab=0;
                      });

                    },
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        SvgPicture.asset("assets/images/market.svg", color: currentTab == 0 ? Colors.white:Colors.grey,width: 25,height: 25),
                        SizedBox(height: 5),
                        Text("Markets",style: TextStyle(color: currentTab == 0 ? Colors.white:Colors.grey,fontSize: 10))

                      ],
                    )
                ),


                MaterialButton(
                    minWidth: 40,
                    onPressed: ()async{
                     // final stores = await createProviders();
                      setState(() {
                        currentScreen= WalletScreen();
                        //currentScreen= MainApp(stores);
                        currentTab=1;
                      });

                    },
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        SvgPicture.asset("assets/icons/wallet.svg", color: currentTab == 1 ? Colors.white:Colors.grey,width: 25,height: 25,),
                        SizedBox(height: 5),
                        Text("Wallet",style: TextStyle(color: currentTab == 1 ? Colors.white:Colors.grey,fontSize: 10))

                      ],
                    )

                ),
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=ExchangeScreen();
                        currentTab=2;
                      });

                    },
                    child:Column(
                      children: [
                        SizedBox(height: 15),
                        SvgPicture.asset("assets/images/exchange.svg", color: currentTab == 2 ? Colors.white:Colors.grey,width: 25,height: 25),
                        SizedBox(height: 5),
                        Text("Exchange",style: TextStyle(color: currentTab == 2 ? Colors.white:Colors.grey,fontSize: 10))

                      ],
                    )


                ),
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=StartExchangeScreen();
                        currentTab=3;
                      });

                    },
                    child:Column(
                      children: [
                        SizedBox(height: 15),
                        SvgPicture.asset("assets/images/transaction.svg", color: currentTab == 3 ? Colors.white:Colors.grey,width: 25,height: 25),
                        SizedBox(height: 5),
                        Text("Transactions",style: TextStyle(color: currentTab == 3 ? Colors.white:Colors.grey,fontSize: 10))

                      ],
                    )


                ),
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=SettingScreen();
                        currentTab=4;
                      });

                    },
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        SvgPicture.asset("assets/images/settings.svg", color: currentTab == 4 ? Colors.white:Colors.grey,width: 25,height: 25),
                        SizedBox(height: 5),
                        Text("Settings",style: TextStyle(color: currentTab == 4 ? Colors.white:Colors.grey,fontSize: 10))

                      ],
                    )




                ),
                SizedBox(width: 5)
              ],
            ),

          ),
        ),
      )





    );
   }

}
