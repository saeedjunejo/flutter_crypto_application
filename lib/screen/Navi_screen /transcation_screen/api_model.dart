class TransactionStatus {
  TransactionStatus({
    required this.id,
    required this.status,
    required this.actionsAvailable,
    required this.fromCurrency,
    required this.fromNetwork,
    required this.toCurrency,
    required this.toNetwork,
    required this.expectedAmountFrom,
    required this.expectedAmountTo,
    required this.amountFrom,
    required this.amountTo,
    required this.payinAddress,
    required this.payoutAddress,
    required this.payinExtraId,
    required this.payoutExtraId,
    required this.refundAddress,
    required this.refundExtraId,
    required this.createdAt,
    required this.updatedAt,
    required this.validUntil,
    required this.depositReceivedAt,
    required this.payinHash,
    required this.payoutHash,
    required this.fromLegacyTicker,
    required this.toLegacyTicker,
    required this.refundHash,
    required this.refundAmount,
  });

  String id;
  String status;
  bool actionsAvailable;
  String fromCurrency;
  String fromNetwork;
  String toCurrency;
  String toNetwork;
  double expectedAmountFrom;
  double expectedAmountTo;
  dynamic amountFrom;
  dynamic amountTo;
  String payinAddress;
  String payoutAddress;
  dynamic payinExtraId;
  dynamic payoutExtraId;
  dynamic refundAddress;
  dynamic refundExtraId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic validUntil;
  dynamic depositReceivedAt;
  dynamic payinHash;
  dynamic payoutHash;
  String fromLegacyTicker;
  String toLegacyTicker;
  dynamic refundHash;
  dynamic refundAmount;

  factory TransactionStatus.fromJson(Map<String, dynamic> json) => TransactionStatus(
    id: json["id"] ?? "",
    status: json["status"] ?? "",
    actionsAvailable: json["actionsAvailable"] ?? "",
    fromCurrency: json["fromCurrency"] ?? "",
    fromNetwork: json["fromNetwork"] ?? "",
    toCurrency: json["toCurrency"] ?? "",
    toNetwork: json["toNetwork"] ?? "",
    expectedAmountFrom: json["expectedAmountFrom"].toDouble() ?? "",
    expectedAmountTo: json["expectedAmountTo"].toDouble() ?? "",
    amountFrom: json["amountFrom"] ?? "",
    amountTo: json["amountTo"] ?? "",
    payinAddress: json["payinAddress"] ?? "",
    payoutAddress: json["payoutAddress"] ?? "",
    payinExtraId: json["payinExtraId"] ?? "",
    payoutExtraId: json["payoutExtraId"] ?? "",
    refundAddress: json["refundAddress"] ?? "",
    refundExtraId: json["refundExtraId"] ?? "",
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    validUntil: json["validUntil"] ?? "",
    depositReceivedAt: json["depositReceivedAt"] ?? "",
    payinHash: json["payinHash"] ?? "",
    payoutHash: json["payoutHash"] ?? "",
    fromLegacyTicker: json["fromLegacyTicker"] ?? "",
    toLegacyTicker: json["toLegacyTicker"] ?? "",
    refundHash: json["refundHash"] ?? "",
    refundAmount: json["refundAmount"] ?? "",
  );
}
