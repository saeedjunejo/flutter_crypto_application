class DataModel {

  String titleCrypto;
  String symbolCrypto;
  String imageUrlCrypto;
  num priceCrypto;
  num chanVolumeCrypto;
  num changePercVolumeCrypto;
  num high_volumeCrypto;
  num low_volumeCrypto;
  num total_volumeCrypto;
  num market_capCrypto;
  num market_cap_ch_24h;
  num market_cap_ch_perc_24h;
  num athCrypto;
  num ath_ch_percentage;
  num atlCrypto;
  num atl_ch_percentage;

  DataModel({
    required this. titleCrypto,
    required this. symbolCrypto,
    required this. imageUrlCrypto,
    required this. priceCrypto,
    required this. chanVolumeCrypto,
    required this. changePercVolumeCrypto,
    required this. high_volumeCrypto,
    required this. low_volumeCrypto,
    required this. total_volumeCrypto,
    required this. market_capCrypto,
    required this. market_cap_ch_24h,
    required this. market_cap_ch_perc_24h,
    required this. athCrypto,
    required this. ath_ch_percentage,
    required this. atlCrypto,
    required this. atl_ch_percentage,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(

      titleCrypto: json['name'] ?? "",
      symbolCrypto: json['symbol'] ?? "",
      imageUrlCrypto: json['image'] ?? "",
      priceCrypto: json['current_price'] ?? "",
      chanVolumeCrypto: json['price_change_24h'] ?? "",
      changePercVolumeCrypto: json['price_change_percentage_24h'] ?? "",
      high_volumeCrypto: json['high_24h'] ?? "",
      low_volumeCrypto: json['low_24h'] ?? "",
      total_volumeCrypto: json['total_volume'] ?? "",
      market_capCrypto: json['market_cap'] ?? "",
      market_cap_ch_24h: json['market_cap_change_24h'] ?? "",
      market_cap_ch_perc_24h: json['market_cap_change_percentage_24h'] ?? "",
      athCrypto: json['ath'] ?? "",
      ath_ch_percentage: json['ath_change_percentage'] ?? "",
      atlCrypto: json['atl'] ?? "",
      atl_ch_percentage: json['atl_change_percentage'] ?? "",

    );
  }
}




