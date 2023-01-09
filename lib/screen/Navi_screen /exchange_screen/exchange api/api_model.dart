class ExchangeApiModel {
  ExchangeApiModel({

    required this.payInAdd,
    required this.payOutAdd,
    required this.payOutExtraId,
    required this.fromCurrencyData,
    required this.toCurrencyData,
    required this.refundAdd,
    required this.refundExtId,
    required this.idExchange,
    required this.getAmount,

  });

  String payInAdd;
  String payOutAdd;
  String payOutExtraId;
  String fromCurrencyData;
  String toCurrencyData;
  String refundAdd;
  String refundExtId;
  String idExchange;
  num getAmount;

  factory ExchangeApiModel.fromJson(Map<String, dynamic> json) => ExchangeApiModel(
    payInAdd: json["payinAddress"] ?? "",
    payOutAdd: json["payoutAddress"] ?? "",
    payOutExtraId: json["payoutExtraId"] ?? "",
    fromCurrencyData: json["fromCurrency"] ?? "",
    toCurrencyData: json["toCurrency"] ?? "",
    refundAdd: json["refundAddress"] ?? "",
    refundExtId: json["refundExtraId"] ?? "",
    idExchange: json["id"] ?? "",
    getAmount: json["amount"] ?? "",
  );
}
