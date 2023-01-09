import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/coinModel.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../utils/coincard.dart';
import '../utils/color.dart';
import '../utils/components.dart';


class CurrencyScreen extends StatefulWidget {

  CurrencyScreen({
    required this.TitleName,
    required this.TitleSymbol,
    required this.CurrencyImageUrl,
    required this.CurrentPrice,
    required this.changeVolume,
    required this.changePercVolume,
    required this.high_volume,
    required this.low_volume,
    required this.total_volume,
    required this.market_cap,
    required this.market_cap_change_24h,
    required this.market_cap_change_percentage_24h,
    required this.ath,
    required this.ath_change_percentage,
    required this.atl,
    required this.atl_change_percentage,
    required this.marketRanking,
    required this.priceChange24H,
    required this.priceChangePerc

  });

  String TitleName;
  String TitleSymbol;
  String CurrencyImageUrl;
  double CurrentPrice;
  double changeVolume;
  double changePercVolume;
  double high_volume;
  double low_volume;
  double total_volume;
  double market_cap;
  double market_cap_change_24h;
  double market_cap_change_percentage_24h;
  double ath;
  double ath_change_percentage;
  double atl;
  double atl_change_percentage;
  double marketRanking;
  double priceChange24H;
  double priceChangePerc;




  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {

  //List<Candle> candles = [];
  //bool themeIsDark = true;
  List<Coin> dCoinList = [];
  //List<String> data = [19557.18, 1009.52, -1000.52, 19350.16,995.18, -10500.52, 1000.52, 19550.16,19557.18, -1009.52, 1000.52, -19450.16,995.18, 11500.52, -1000.52, 19550.16,];

  //dynamic dropdownValue=coinList[0].name;



  @override
  void initState() {
    dCoinList.addAll(coinList);

    data;


    //Timer.periodic(Duration(seconds: 3), (timer) {data;});
    //Future.delayed(const Duration(seconds: 1),fetchCandles);


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


    // fetchCandles().then((value) {
    //   Timer.periodic(Duration(seconds: 3), (timer) {fetchCandles();});
    //   //Future.delayed(const Duration(seconds: 2),fetchCandles);
    //   setState(() {
    //     candles = value;
    //   });
    // });
    super.initState();
  }



  // Future<List<Candle>> fetchCandles() async {
  //   final uri = Uri.parse("https://api.binance.com/api/v3/klines?symbol=ETHUSDT&interval=1h");
  //   final res = await http.get(uri);
  //   return (jsonDecode(res.body) as List<dynamic>)
  //       .map((e) => Candle.fromJson(e))
  //       .toList()
  //       .reversed
  //       .toList();
  //
  //
  // }
  //var data = <CandlestickData>[];


  var data = [-19557.18, 1009.52, -1000.52, 19350.16,995.18, -10500.52, 1000.52, 19550.16,19557.18, -1009.52, 1000.52, -19450.16,995.18, 11500.52, -1000.52, 19550.16,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 0,right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                        width: 35,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF191919),
                        ),
                        child: Icon(Icons.arrow_back,color: Colors.white)),
                  )),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ButtonsTabBar(
                  backgroundColor: Color(0xFF191919),
                  unselectedBackgroundColor: Colors.white12,
                  unselectedLabelStyle: TextStyle(color: Colors.white10),
                  labelStyle: TextStyle(color: Colors.white, fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20),
                  buttonMargin: EdgeInsets.only(left: 0,right: 25),

                  tabs: [
                    Tab(text: "  Overview  ",),
                    Tab(text: "    Market     "),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle
                                          ),
                                          height: 40,
                                          width: 40,
                                          child: Image.network(widget.CurrencyImageUrl)),
                                      SizedBox(width: 15),
                                      Text(widget.TitleName.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,)),
                                      Spacer(),
                                      Text("MARKET RANK # "+widget.marketRanking.toStringAsFixed(0).toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),


                                    ]
                                ),

                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('\$ '+ Decimal.parse(widget.CurrentPrice.toDouble().toString()).toString(),style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text('\$ '+widget.CurrentPrice.toDouble().toString(),style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                            SizedBox(width: 10),
                                            Text(
                                              widget.changePercVolume.toDouble() < 0
                                                  ? widget.changePercVolume.toDouble().toString() + '%'
                                                  : '+' + widget.changePercVolume.toDouble().toString() + '%',
                                              style: TextStyle(
                                                color: widget.changePercVolume.toDouble() < 0
                                                    ? Colors.red
                                                    : Colors.green,
                                                fontSize: 12,
                                                fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 2,
                                      color: Colors.white30,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Price Change 24H",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                            SizedBox(height: 10),
                                            Text(widget.priceChange24H.toStringAsExponential(3).toString(),style: TextStyle(color: Colors.red,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 50,
                                          width: 2,
                                          color: Colors.white30,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Price Change % ",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                            SizedBox(height: 10),
                                            Text(widget.priceChangePerc.toStringAsExponential(3).toString()+" %",style: TextStyle(color: Colors.red,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(height: 30),

                                // RefreshIndicator(
                                //     child: graphRefresh(),
                                //     onRefresh: ()async{
                                //       setState(() {
                                //         data;
                                //       });
                                //
                                //     }),
                              ],
                            ),
                          ),



                          graphRefresh(),




                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                      height: Get.height * 0.05,
                                      width: Get.width*0.18,
                                      text: '1h',
                                      fontSize: Get.height * 0.025,
                                      onPressed: () {},
                                    ),
                                    CustomButton(
                                      height: Get.height * 0.05,
                                      width: Get.width*0.18,
                                      text: '24h',
                                      fontSize: Get.height * 0.025,
                                      onPressed: () {},
                                    ),
                                    CustomButton(
                                      height: Get.height * 0.05,
                                      width: Get.width*0.18,
                                      text: '7d',
                                      fontSize: Get.height * 0.025,
                                      onPressed: () {},
                                    ),
                                    CustomButton(
                                      height: Get.height * 0.05,
                                      width: Get.width*0.18,
                                      text: '14d',
                                      fontSize: Get.height * 0.025,
                                      onPressed: () {},
                                    ),


                                  ],
                                ),





                                // Container(
                                //     width: Get.width,
                                //     height: Get.height*0.40,
                                //     child: Candlesticks(
                                //       candles: candles,
                                //
                                //       actions: [
                                //
                                //       ],
                                //     )
                                // ),




                                SizedBox(height: 30),
                                Text(" Total Volume",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                                SizedBox(height: 10),
                                otherData("Trading Volume",widget.total_volume.toStringAsExponential(3).toString()),

                                SizedBox(height: 20),
                                Text(" Market Cap",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                                SizedBox(height: 10),
                                otherData("Market Cap",widget.market_cap.toStringAsExponential(3).toString()),
                                SizedBox(height: 10),
                                otherData("Market Cap 24h",widget.market_cap_change_24h.toStringAsExponential(3).toString(),),
                                SizedBox(height: 10),

                                Container(
                                  width: Get.width,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF191919),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Market Cap Percentage",style: TextStyle(color: Color(0xFFf2f2f2),fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                        Text(
                                          widget.market_cap_change_percentage_24h.toDouble() < 0
                                              ? widget.market_cap_change_percentage_24h.toDouble().toString() + '%'
                                              : '+' + widget.market_cap_change_percentage_24h.toDouble().toString() + '%',
                                          style: TextStyle(
                                              color: widget.market_cap_change_percentage_24h.toDouble() < 0
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: 15,
                                              fontFamily: 'Quicksand',fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ),





                                SizedBox(height: 30),
                                Text(" All Time High",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                SizedBox(height: 10),
                                otherData("ATH",widget.ath.toStringAsExponential(3).toString()),
                                SizedBox(height: 10),

                                Container(
                                  width: Get.width,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF191919),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ATH Percentage",style: TextStyle(color: Color(0xFFf2f2f2),fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                        Text(
                                          widget.ath_change_percentage.toDouble() < 0
                                              ? widget.ath_change_percentage.toDouble().toString() + '%'
                                              : '+' + widget.ath_change_percentage.toDouble().toString() + '%',
                                          style: TextStyle(
                                              color: widget.ath_change_percentage.toDouble() < 0
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: 15,
                                              fontFamily: 'Quicksand',fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),

                                ),

                                SizedBox(height: 30),
                                Text(" All Time Low",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                SizedBox(height: 10),
                                otherData("ATL",widget.atl.toStringAsExponential(3).toString()),
                                SizedBox(height: 10),


                                Container(
                                  width: Get.width,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF191919),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ATL Percentage",style: TextStyle(color: Color(0xFFf2f2f2),fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                        Text(
                                          widget.atl_change_percentage.toDouble() < 0
                                              ? widget.atl_change_percentage.toDouble().toString() + '%'
                                              : '+' + widget.atl_change_percentage.toDouble().toString() + '%',
                                          style: TextStyle(
                                            color: widget.atl_change_percentage.toDouble() < 0
                                                ? Colors.red
                                                : Colors.green,
                                            fontSize: 15,
                                            fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ),

                                SizedBox(height: 50),


                                Center(child: SvgPicture.asset("assets/icons/logo.svg",width: 30,height: 30)),
                                SizedBox(height: 50),

                                Center(child: Text("Developed By Renexcode ",style: TextStyle(color: Colors.white,fontSize: 6,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                    SingleChildScrollView(
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



                        ): Align(alignment: FractionalOffset.topCenter, child: CircularProgressIndicator(color: Colors.white))

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }











Widget graphRefresh(){
    return  Container(
      width: 700.0,
      height: 150.0,
      decoration: BoxDecoration(
          color: customBlack
      ),
      child: Sparkline(
        data: data,
        fillMode: FillMode.below,
        pointsMode: PointsMode.all,
        pointSize: 3.0,
        lineWidth: 1.0,
        lineGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [customNavBlue, customBlue],
        ),
        pointColor: Colors.white,
        fillGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFee0979), Color(0xFFff6a00),],
        ),
      ),
    );
}











  Widget otherData(String title, String value){
    return Container(
      width: Get.width,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF191919),

      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(color: Color(0xFFf2f2f2),fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
            Text(value,style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))
          ],
        ),
      ),


    );



  }

}




