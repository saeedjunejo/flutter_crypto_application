import 'dart:async';
import 'dart:convert';
import 'package:air_pay/screen/market_screen.dart';
import 'package:air_pay/screen/userAuth_screen/profile_screen.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/coinModel.dart';
import '../../utils/coincard.dart';
import '../../utils/components.dart';
import '../api_model/data_get.dart';



class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {



  final search =TextEditingController();
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



  @override
  void initState() {
    fetchCoin();
    marketCoinList.addAll(coinList);
    super.initState();

    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();

    // rootBundle.loadString('assets/data.json').then((json) {
    //   CandlestickData map(item) => CandlestickData(
    //     DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
    //     item['open'].toDouble(),
    //     item['high'].toDouble(),
    //     item['low'].toDouble(),
    //     item['close'].toDouble(),
    //     item['vol'].toDouble(),
    //   );
    //   final items = jsonDecode(json) as List<dynamic>;
    //   setState(() {
    //     data = items.map<CandlestickData>(map).toList().reversed.toList();
    //   });
    // });

  }

  List<Coin> dCoinList = [];

  //List<Candle> candles = [];
  //int touchedIndex = 0;

  //var data = <CandlestickData>[];
  _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => ExitAlertDialog(),
    );
  }
  var dataMarketCap = [-19557.18, 1009.52, -1000.52, 13350.16,995.18, -10100.52, 800.52,19350.16,995.18, -1000.52, -700.52];
  var dataMarketCap1 = [10557.18, -1009.52, -500.52, 10350.16,595.18, -30000.52, 500.52,12350.16,995.18,  -400.52];
  var dataMarketCap2 = [10557.18, 109.52, -700.52, 1350.16,495.18, -20800.52, 300.52,];
  var dataMarketCap3 = [11557.18, -1029.52, -2000.52, 9350.16,395.18, -10100.52, 100.52,13350.16,995.18, -10100.52, 800.52];

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    final postModel = Provider.of<DataClass>(context);
    return WillPopScope(
        onWillPop: () => _onBackPressed(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor:customBlack,
          appBar: AppBar(
            title: Text("Markets",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
            elevation: 0.2,
            backgroundColor:customBlack,
            actions: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MarketScreen()));
                  },
                child: Icon(Icons.search,size: 30,color: Colors.white30),
              ),

              SizedBox(width: 20),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));

                },
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF191919),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: SvgPicture.asset("assets/icons/avatar.svg",color: Colors.white30),
                    )
                ),
              ),

              SizedBox(width: 20),

            ],
          ),
          drawer: Drawer(
              backgroundColor: customBlack,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text("Trade",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF191919),
                        borderRadius: BorderRadius.circular(15),

                      ),
                      child: TextField(
                        textInputAction: TextInputAction.search,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              child: Icon(Icons.search,color: Colors.white30),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Search ',hintStyle: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)
                        ),
                        onChanged: (val) {
                          setState(() {
                            dCoinList = coinList.where((u) => (u.name.toLowerCase().contains(val.toLowerCase(),)),).toList();


                          });


                        },
                      ),
                    ),

                    Expanded(
                        child:  SingleChildScrollView(
                            child:dCoinList.isNotEmpty? Container(
                                width: Get.width,
                                height: Get.height,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: dCoinList.length,
                                  itemBuilder: (context, index) {
                                    return CoinCard(
                                      name: dCoinList[index].name,
                                      symbol: dCoinList[index].symbol,
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



                            ):Align(alignment: FractionalOffset.topCenter, child: CircularProgressIndicator(color: Colors.blue))))
                  ],
                ),
              )
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text("Total Market Cap",style: TextStyle(color: Colors.white60,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                SizedBox(height: 5),

                Row(
                  children: [
                    Text("\$ ${postModel.post?.market_capCrypto.toStringAsExponential(3).toString() ?? ""}",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Text("${postModel.post?.market_cap_ch_perc_24h.toDouble().toString() ?? ""} %",style: TextStyle(color: Colors.green,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                  ],
                ),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width*0.43,
                      height: size.height*0.10,
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
                GestureDetector(
                  onTap: (){

                    Share.share('check out my website https://example.com', subject: 'Look what I made!');
                  },
                  child: Container(
                    width: Get.width*1,
                    height: Get.height*0.09,
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

                          SvgPicture.asset("assets/icons/message.svg",width: 30,height: 35,),
                          SizedBox(width:10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Referral",style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                              Text("Invite your friends to join on AirPay\nand get up to 40",style: TextStyle(color: Colors.white,fontSize: 10,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)


                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Expanded(
                  child:  SingleChildScrollView(
                      child:coinList.isNotEmpty? Container(
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



                      ): Align(alignment: FractionalOffset.topCenter, child: CircularProgressIndicator(color: Colors.blue))

                  ),


                )















              ],
            ),
          )


      )
    );
  }
}

















Widget customPeople(String image,String title,String currency,String amount,String amountLess){
  return Container(
    width: Get.width*0.85,
    height: Get.height*0.085,
    color: Color(0xFF31394E),
    child: Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/icons/pic.jpeg")
              )
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(color: Colors.white,fontSize: 15)),
              Text(currency,style: TextStyle(color: Color(0xFF707070),fontSize: 15)),

            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(amount,style: TextStyle(color: Colors.white,fontSize: 15)),
              Text(amountLess,style: TextStyle(color: Color(0xFF0DFF98),fontSize: 15)),
            ],
          ),


        ],
      ),
    ),
  );
}

Widget customHome(String image,String title,String currency,String amount,String amountLess){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Container(
      width: Get.width*1,
      height: Get.height*0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF31394E),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(color: Colors.white,fontSize: 15)),
                Text(currency,style: TextStyle(color: Color(0xFF707070),fontSize: 15)),

              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(amount,style: TextStyle(color: Colors.white,fontSize: 15)),
                Text(amountLess,style: TextStyle(color: Color(0xFF0DFF98),fontSize: 15)),
              ],
            ),


          ],
        ),
      ),
    ),
  );
}



