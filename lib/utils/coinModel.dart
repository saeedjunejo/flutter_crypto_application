class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.highVolume,
    required this.lowVolume,
    required this.totalVolume,
    required this.market_cap,
    required this.market_cap_change_24h,
    required this.market_cap_change_percentage_24h,
    required this.ath,
    required this.ath_change_percentage,
    required this.atl,
    required this.atl_change_percentage,
    required this.market_rank,
    required this.price_change_24h,
    required this.price_change_percentage_24h
  });

  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  num highVolume;
  num lowVolume;
  num totalVolume;
  num market_cap;
  num market_cap_change_24h;
  num market_cap_change_percentage_24h;
  num ath;
  num ath_change_percentage;
  num atl;
  num atl_change_percentage;
  num market_rank;
  num price_change_24h;
  double price_change_percentage_24h;






  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(

      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
      highVolume: json['high_24h'],
      lowVolume: json['low_24h'],
      totalVolume: json['total_volume'],
      market_cap: json['market_cap'],
      market_cap_change_24h: json['market_cap_change_24h'],
      market_cap_change_percentage_24h: json['market_cap_change_percentage_24h'],
      ath: json['ath'],
      ath_change_percentage: json['ath_change_percentage'],
      atl: json['atl'],
      atl_change_percentage: json['atl_change_percentage'],
      market_rank: json['market_cap_rank'],
      price_change_24h: json['price_change_24h'],
      price_change_percentage_24h: json['price_change_percentage_24h']



    );
  }
}


List<Coin> coinList = [];

