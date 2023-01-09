class DepositCrypto {
  DepositCrypto({
    required this.fromAmount,
    required this.toAmount,
    required this.flow,
    required this.type,
    required this.payinAddress,
    required this.payoutAddress,
    required this.payoutExtraId,
    required this.fromCurrency,
    required this.toCurrency,
    required this.refundAddress,
    required this.refundExtraId,
    required this.id,
    required this.fromNetwork,
    required this.toNetwork,
  });

  double fromAmount;
  double toAmount;
  String flow;
  String type;
  String payinAddress;
  String payoutAddress;
  String payoutExtraId;
  String fromCurrency;
  String toCurrency;
  String refundAddress;
  String refundExtraId;
  String id;
  String fromNetwork;
  String toNetwork;

  factory DepositCrypto.fromJson(Map<String, dynamic> json) => DepositCrypto(
    fromAmount: json["fromAmount"].toDouble() ?? "",
    toAmount: json["toAmount"].toDouble() ?? "",
    flow: json["flow"] ?? "",
    type: json["type"] ?? "",
    payinAddress: json["payinAddress"] ?? "",
    payoutAddress: json["payoutAddress"] ?? "",
    payoutExtraId: json["payoutExtraId"] ?? "",
    fromCurrency: json["fromCurrency"] ?? "",
    toCurrency: json["toCurrency"] ?? "",
    refundAddress: json["refundAddress"] ?? "",
    refundExtraId: json["refundExtraId"] ?? "",
    id: json["id"] ?? "",
    fromNetwork: json["fromNetwork"] ?? "",
    toNetwork: json["toNetwork"] ?? "",
  );
}
