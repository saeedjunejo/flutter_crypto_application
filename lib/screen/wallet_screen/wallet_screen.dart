import 'dart:convert';
import 'package:air_pay/screen/wallet_screen/connect_wallet/connect_wallet.dart';
import 'package:air_pay/screen/wallet_screen/sell_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_candlestick_chart/simple_candlestick_chart.dart';
import 'package:web3_connect/web3_connect.dart';
import '../../utils/coinModel.dart';
import '../../utils/coincard.dart';
import '../../utils/components.dart';
import '../api_model/data_get.dart';
import 'package:http/http.dart' as http;
import 'buy_screen.dart';
import 'connect_metamask/metamask_auth.dart';
import 'connect_wallet/check_wallet.dart';
import 'deposit_crypto/deposite_screen.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  void initState() {
    fetchCoin();
    marketCoinList.addAll(coinList);
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();

    rootBundle.loadString('assets/data.json').then((json) {
      CandlestickData map(item) => CandlestickData(
        DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
        item['open'].toDouble(),
        item['high'].toDouble(),
        item['low'].toDouble(),
        item['close'].toDouble(),
        item['vol'].toDouble(),
      );
      final items = jsonDecode(json) as List<dynamic>;
      setState(() {
        data = items.map<CandlestickData>(map).toList().reversed.toList();
      });
    });

    super.initState();

  }
  var data = <CandlestickData>[];
  List<Coin> dCoinList = [];
  List<Coin> marketCoinList = [];

  Future<List<Coin>> fetchCoin() async {

    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }

        dCoinList.addAll(coinList);
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }
  bool market=false;
  Web3Connect connection = Web3Connect();
  final walletSearch = TextEditingController();

  var dataMarketCap = [-19557.18, 1009.52, -1000.52, 13350.16,995.18, -10100.52, 800.52,19350.16,995.18, -1000.52, -700.52];
  var dataMarketCap1 = [10557.18, -1009.52, -500.52, 10350.16,595.18, -30000.52, 500.52,12350.16,995.18,  -400.52];
  var dataMarketCap2 = [10557.18, 109.52, -700.52, 1350.16,495.18, -20800.52, 300.52,];
  var dataMarketCap3 = [11557.18, -1029.52, -2000.52, 9350.16,395.18, -10100.52, 100.52,13350.16,995.18, -10100.52, 800.52];


  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      backgroundColor: customBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: Get.width,
              height: Get.height*0.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [customNavBlue, customBlue],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)
                  )

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text("Your Wallet",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                  SizedBox(height: 20),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    borderRadius: 20,
                    blur: 7,
                    alignment: Alignment.center,
                    border: 0,
                    linearGradient: LinearGradient(colors: [Colors.white.withAlpha(45), Colors.white.withAlpha(55)],),
                    borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          height: Get.height * 0.06,
                          width: Get.width*0.35,
                          text: 'Deposit',
                          fontSize: Get.height * 0.018,
                          onPressed: () {
                            setState(() {
                              showAlertDeposit(context);
                            });

                          },
                        ),
                        SizedBox(width: 20),
                        CustomButRegister(
                          height: Get.height * 0.055,
                          width: Get.width*0.35,
                          text: 'Trade',
                          fontSize: Get.height * 0.018,
                          onPressed: () {
                            setState(() {
                              showAlertBuySell(context);
                            });

                          },
                        ),

                      ],
                    ),

                  ),

                  SizedBox(height: 20),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    borderRadius: 20,
                    blur: 7,
                    alignment: Alignment.center,
                    border: 0,
                    linearGradient: LinearGradient(
                      colors: [Colors.white.withAlpha(45), Colors.white.withAlpha(55)],

                    ),
                    borderGradient: LinearGradient(
                        colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],

                    ),

                    child: CustomConnectWa(
                      height: Get.height * 0.06,
                      width: Get.width*0.7,
                      text: 'Connect Wallet',
                      fontSize: Get.height * 0.020,
                      onPressed: () {
                        showAlertConnectWallet(context);
                      },
                    ),

                  ),

                  SizedBox(height: 20),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    borderRadius: 20,
                    blur: 7,
                    alignment: Alignment.center,
                    border: 0,
                    linearGradient: LinearGradient(
                        colors: [
                          Colors.white.withAlpha(45),
                          Colors.white.withAlpha(55),

                        ],
                        ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(100),
                        Colors.white.withAlpha(55),
                      ],

                    ),

                    child: CustomConnectMetamask(
                      height: Get.height * 0.06,
                      width: Get.width*0.7,
                      text: 'Connect Metamask',
                      fontSize: Get.height * 0.020,
                      onPressed: () {
                        setState(() {
                          showAlertConnMetamask(context);
                        });


                      },
                    ),

                  ),

                  SizedBox(height: 20),


                ],
              ),
            ),
            SizedBox(height: 25),

            SingleChildScrollView(
                child: Marquee(
                    child: coinList.isNotEmpty?Container(
                        width: Get.width,
                        height: Get.height*0.1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dCoinList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return   Container(
                              height: 20,
                              color: Color(0xFF191919),
                              child: Marquee(
                                autoRepeat: true,
                                child:  Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(shape: BoxShape.circle),
                                      height: 35,
                                      width: 35,
                                      child: Image.network( dCoinList[index].imageUrl,),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(dCoinList[index].symbol.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Quicksand',fontWeight: FontWeight.w600),),
                                        SizedBox(height: 3),
                                        Text(dCoinList[index].price.toDouble().toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Quicksand',fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                    SizedBox(width: 15),

                                  ],
                                ),
                              ),
                            );

                          },
                        )



                    ): Align(alignment: FractionalOffset.topCenter, child: CircularProgressIndicator(color: Colors.blue))
                )
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [

                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width*0.43,
                        height: Get.height*0.10,
                        decoration: BoxDecoration(
                            color: Color(0xFF191919),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("Market Cap 24h",style: TextStyle(color: Colors.white60,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 8),
                                  Text("\$ ${postModel.post?.market_cap_ch_24h.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 4),
                                  Text("${postModel.post?.market_cap_ch_perc_24h.toDouble().toString() ?? ""} %",style: TextStyle(color: Colors.green,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Color(0xFF191919)
                                ),
                                child: Sparkline(
                                  data: dataMarketCap1,
                                  fillMode: FillMode.below,
                                  pointsMode: PointsMode.all,
                                  pointSize: 3.0,
                                  lineWidth: 3.0,
                                  lineGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [customNavBlue, customBlue],
                                  ),
                                  pointColor: Colors.white,
                                  fillGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.deepOrangeAccent, Colors.white],
                                  ),
                                ),
                              ),

                              // SizedBox(
                              //   height: 62,
                              //   width: 75,
                              //   child: SimpleCandlestickChart(
                              //     data: data,
                              //     increaseColor: Colors.teal,
                              //     decreaseColor: Colors.pinkAccent,
                              //     maxItemWidth: 50,
                              //     physics:  BouncingScrollPhysics(),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width*0.43,
                        height: Get.height*0.10,
                        decoration: BoxDecoration(
                            color: Color(0xFF191919),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("High Volume",style: TextStyle(color: Colors.white60,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 2),
                                  Text("\$ ${postModel.post?.high_volumeCrypto.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 5),
                                  Text("Low Volume",style: TextStyle(color: Colors.white60,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 2),
                                  Text("\$ ${postModel.post?.high_volumeCrypto.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),

                                ],
                              ),
                              Container(
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Color(0xFF191919)
                                ),
                                child: Sparkline(
                                  data: dataMarketCap2,
                                  fillMode: FillMode.below,
                                  pointsMode: PointsMode.all,
                                  pointSize: 3.0,
                                  lineWidth: 3.0,
                                  lineGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [customNavBlue, customBlue],
                                  ),
                                  pointColor: Colors.white,
                                  fillGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.deepOrange, Colors.pinkAccent],
                                  ),
                                ),
                              ),

                              // SizedBox(
                              //   height: 62,
                              //   width: 80,
                              //   child: SimpleCandlestickChart(
                              //     data: data,
                              //     increaseColor: Colors.teal,
                              //     decreaseColor: Colors.pinkAccent,
                              //     maxItemWidth: 50,
                              //     physics:  BouncingScrollPhysics(),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width*0.43,
                        height: Get.height*0.10,
                        decoration: BoxDecoration(
                            color: Color(0xFF191919),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("All Time High",style: TextStyle(color: Colors.white60,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 8),
                                  Text("\$ ${postModel.post?.athCrypto.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 4),
                                  Text("${postModel.post?.ath_ch_percentage.toDouble().toString() ?? "" } %",style: TextStyle(color: Colors.green,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Color(0xFF191919)
                                ),
                                child: Sparkline(
                                  data: dataMarketCap,
                                  fillMode: FillMode.below,
                                  pointsMode: PointsMode.all,
                                  pointSize: 3.0,
                                  lineWidth: 3.0,
                                  lineGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [customNavBlue, customBlue],
                                  ),
                                  pointColor: Colors.white,
                                  fillGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.pinkAccent, Colors.green],
                                  ),
                                ),
                              ),

                              // SizedBox(
                              //   height: 62,
                              //   width: 80,
                              //   child: SimpleCandlestickChart(
                              //     data: data,
                              //     increaseColor: Colors.teal,
                              //     decreaseColor: Colors.pinkAccent,
                              //     maxItemWidth: 50,
                              //     physics:  BouncingScrollPhysics(),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width*0.43,
                        height: Get.height*0.10,
                        decoration: BoxDecoration(
                            color: Color(0xFF191919),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("All Time Low",style: TextStyle(color: Colors.white60,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 10),
                                  Text("\$ ${postModel.post?.atlCrypto.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(height: 4),
                                  Text("${postModel.post?.atl_ch_percentage.toDouble().toString() ?? ""} %",style: TextStyle(color: Colors.green,fontSize: 9,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Color(0xFF191919)
                                ),
                                child: Sparkline(
                                  data: dataMarketCap3,
                                  fillMode: FillMode.below,
                                  pointsMode: PointsMode.all,
                                  pointSize: 3.0,
                                  lineWidth: 3.0,
                                  lineGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [customNavBlue, customBlue],
                                  ),
                                  pointColor: Colors.white,
                                  fillGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.yellow, Colors.black],
                                  ),
                                ),
                              ),

                              // SizedBox(
                              //   height: 62,
                              //   width: 80,
                              //   child: SimpleCandlestickChart(
                              //     data: data,
                              //     increaseColor: Colors.teal,
                              //     decreaseColor: Colors.pinkAccent,
                              //     maxItemWidth: 50,
                              //     physics:  BouncingScrollPhysics(),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      setState(() {market=!market;});},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Markets Details",style: TextStyle(fontSize: 18,color: Colors.white54,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  market ? marketsDetails():
                  SizedBox(height: 50),

                  Center(child: SvgPicture.asset("assets/icons/logo.svg",width: 30,height: 30)),
                  SizedBox(height: 50),

                  Center(child: Text("TERMS OF USE PRIVACY POLICY ",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
                  SizedBox(height: 30),
                  Center(child: Text("Developed by Renexcode ",style: TextStyle(color: Colors.white,fontSize: 6,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
                  SizedBox(height: 30),
                  

                  
                ]


              ),
            ),

          ],
        )
      )
    );
  }


  Widget marketsDetails(){
    return Container(
        width: Get.width,
        height: Get.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dCoinList.length,
          itemBuilder: (context, index) {
            return  CoinCard(
              name: dCoinList[index].name,
              symbol: dCoinList[index].symbol.toUpperCase(),
              imageUrl: dCoinList[index].imageUrl,
              price: dCoinList[index].price.toDouble(),
              change: dCoinList[index].change.toDouble(),
              changePercentage: dCoinList[index].changePercentage.toDouble(),
              low_volume: dCoinList[index].lowVolume.toDouble(),
              high_volume: dCoinList[index].highVolume.toDouble(),
              totalVolume: dCoinList[index].totalVolume.toDouble(),
              marketCap: dCoinList[index].market_cap.toDouble(),
              marketCap24h: dCoinList[index].market_cap_change_24h.toDouble(),
              marketCapPercentage_24h: dCoinList[index].market_cap_change_percentage_24h.toDouble(),
              ath_data: dCoinList[index].ath.toDouble(),
              athChangePercentage: dCoinList[index].ath_change_percentage.toDouble(),
              atl_data: dCoinList[index].atl.toDouble(),
              atlChangePercentage: dCoinList[index].atl_change_percentage.toDouble(),
              marketRank: dCoinList[index].market_rank.toDouble(),
              priceChange24h: dCoinList[index].price_change_24h.toDouble(),
              priceChangePerc24h: dCoinList[index].price_change_percentage_24h.toDouble(),

            );
          },
        )



    );
}
  showAlertDeposit(BuildContext context) {

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
              height: Get.height*0.22,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/depositpop.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 50),
            Text("Air Pay Crypto you can deposit.",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 20),
            CustomButton(
              height: Get.height * 0.075,
              width: Get.width*0.75,
              text: 'Deposit',
              fontSize: Get.height * 0.025,
              onPressed: () {
                Get.to(()=>DepositScreen());

              },
            ),
            SizedBox(height: 25),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.75,
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
  showAlertBuySell(BuildContext context) {

    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xFF373F45),
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 20,right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 30),
            // Container(
            //   width: Get.width*0.35,
            //   height: Get.height*0.20 ,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.rectangle,
            //       image: DecorationImage(
            //           image: AssetImage("assets/icons/buysell .png"),
            //           fit: BoxFit.fill
            //       )
            //   ),
            //
            //
            // ),
            // SizedBox(height: 40),
            // Text("Select Type",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            // SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomButton(
            //       height: Get.height * 0.075,
            //       width: Get.width*0.35,
            //       text: 'Buy',
            //       fontSize: Get.height * 0.025,
            //       onPressed: () {Get.to(()=>BuyScreen());},
            //     ),
            //     SizedBox(width: 30),
            //     CustomButRegister(
            //       height: Get.height * 0.07,
            //       width: Get.width*0.35,
            //       text: 'Sell',
            //       fontSize: Get.height * 0.025,
            //       onPressed: () {
            //         Get.to(()=>SellScreen());
            //       },
            //     ),
            //
            //   ],
            // ),
            // SizedBox(height: 35),
            // CustomButRegister(
            //   height: Get.height * 0.07,
            //   width: Get.width*0.60,
            //   text: 'Cancel',
            //   fontSize: Get.height * 0.025,
            //   onPressed: () {
            //     Get.back();
            //   },
            // ),
            // SizedBox(height: 10),



            SizedBox(height: 10),
            Text("Select Buy crypto third party wallet",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),

            SizedBox(height: 20),
            GlassmorphicContainer(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height * 0.18,
                borderRadius: 20,
                blur: 7,
                alignment: Alignment.center,
                border: 0,
                linearGradient: LinearGradient(colors: [Colors.white.withAlpha(50), Colors.white.withAlpha(40)],),
                borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 30,
                            height:30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/icons/transk.jpeg"),)
                            )),
                        SizedBox(width: 15),
                        Text("Buy Crypto",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      ],
                    ),
                    SizedBox(height: 15),
                    CustomButton(
                      height: Get.height * 0.070,
                      width: Get.width*0.70,
                      text: 'Buy',
                      fontSize: Get.height * 0.025,
                      onPressed: () {
                        Get.to(()=>BuyScreen());
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                )
            ),

            SizedBox(height: 15),
            GlassmorphicContainer(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height * 0.18,
                borderRadius: 20,
                blur: 7,
                alignment: Alignment.center,
                border: 0,
                linearGradient: LinearGradient(colors: [Colors.white.withAlpha(50), Colors.white.withAlpha(40)],),
                borderGradient: LinearGradient(colors: [Colors.white.withAlpha(100), Colors.white.withAlpha(55),],),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 30,
                            height:30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/ramp.png"),)
                            )),
                        SizedBox(width: 15),
                        Text("Buy Crypto",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      ],
                    ),
                    SizedBox(height: 15),
                    CustomButton(
                      height: Get.height * 0.070,
                      width: Get.width*0.70,
                      text: 'Buy',
                      fontSize: Get.height * 0.025,
                      onPressed: () {
                        Get.to(()=>SellScreen());

                      },
                    ),
                  ],
                )
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





















