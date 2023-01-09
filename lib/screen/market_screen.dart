import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/coinModel.dart';
import '../utils/coincard.dart';



class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final search=TextEditingController();

  List<Coin> dCoinList = [];

  @override
  void initState() {
    dCoinList.addAll(coinList);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 30),
            InkWell(
              onTap: (){
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

            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF191919),
                borderRadius: BorderRadius.circular(15),

              ),
              child: TextField(
                textInputAction: TextInputAction.search,style: TextStyle(color: Colors.white30,fontWeight: FontWeight.bold),
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

            SizedBox(height: 15),
            Expanded(
            child: SingleChildScrollView(
            child: coinList.isNotEmpty?Container(
                width: Get.width,
                height: Get.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dCoinList.length,
                  itemBuilder: (context, index) {
                    return CoinCard(
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

            ):Align(alignment: FractionalOffset.topCenter, child: CircularProgressIndicator(color: Colors.white))
        ))
          ]
        ),
      ),
    );




  }
}


