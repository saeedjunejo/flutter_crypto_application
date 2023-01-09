import 'package:flutter/material.dart';
import '../screen/curreny_Screen.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this. high_volume,
    required this.low_volume,
    required this.totalVolume,
    required this.marketCap,
    required this.marketCap24h,
    required this.marketCapPercentage_24h,
    required this.ath_data,
    required this.athChangePercentage,
    required this.atl_data,
    required this.atlChangePercentage,
    required this.marketRank,
    required this.priceChange24h,
    required this.priceChangePerc24h


  });

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;
  double high_volume;
  double low_volume;
  double totalVolume;
  double marketCap;
  double marketCap24h;
  double marketCapPercentage_24h;
  double ath_data;
  double athChangePercentage;
  double atl_data;
  double atlChangePercentage;
  double marketRank;
  double priceChange24h;
  double priceChangePerc24h;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrencyScreen(TitleName: name, TitleSymbol: symbol, CurrencyImageUrl: imageUrl, CurrentPrice: price, changeVolume: change, changePercVolume: changePercentage,high_volume: high_volume,low_volume: low_volume,total_volume: totalVolume,market_cap: marketCap,market_cap_change_24h: marketCap24h,market_cap_change_percentage_24h: marketCapPercentage_24h,ath: ath_data,atl: atl_data,ath_change_percentage: athChangePercentage,atl_change_percentage: atlChangePercentage,marketRanking: marketRank,priceChange24H: priceChange24h,priceChangePerc:priceChangePerc24h)));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF191919),

              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          height: 35,
                          width: 35,
                          child: Image.network(imageUrl),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(name, style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Quicksand',fontWeight: FontWeight.w600),),
                            ),
                            SizedBox(height: 3),
                            Text(
                              symbol,
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 12,
                                  fontFamily: 'Quicksand',fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(price.toDouble().toString(), style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Quicksand',fontWeight: FontWeight.w600),),
                        Text(
                          changePercentage.toDouble() < 0
                              ? changePercentage.toDouble().toString() + '%'
                              : '+' + changePercentage.toDouble().toString() + '%',
                          style: TextStyle(
                              color: changePercentage.toDouble() < 0
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 13,
                              fontFamily: 'Quicksand',fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}






