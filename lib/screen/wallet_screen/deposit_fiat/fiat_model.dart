
class DepositFiat {
  DepositFiat({
    required this.id,
    required this.status,
    required this.email,
    required this.errors,
    required this.statusDetails,
    required this.fromCurrency,
    required this.fromNetwork,
    required this.fromCurrencyWithNetwork,
    required this.fromAmount,
    required this.depositType,
    required this.payoutType,
    required this.expectedFromAmount,
    required this.toCurrency,
    required this.toNetwork,
    required this.toCurrencyWithNetwork,
    required this.toAmount,
    required this.outputHash,
    required this.expectedToAmount,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.partnerId,
    required this.externalPartnerLinkId,
    required this.estimateBreakdown,
    required this.payout,
    required this.redirectUrl,
  });

  String id;
  String status;
  dynamic email;
  List<dynamic> errors;
  dynamic statusDetails;
  String fromCurrency;
  dynamic fromNetwork;
  dynamic fromCurrencyWithNetwork;
  String fromAmount;
  String depositType;
  String payoutType;
  String expectedFromAmount;
  String toCurrency;
  dynamic toNetwork;
  dynamic toCurrencyWithNetwork;
  dynamic toAmount;
  dynamic outputHash;
  String expectedToAmount;
  String location;
  DateTime createdAt;
  DateTime updatedAt;
  String partnerId;
  dynamic externalPartnerLinkId;
  EstimateBreakdown estimateBreakdown;
  Payout payout;
  String redirectUrl;

  factory DepositFiat.fromJson(Map<String, dynamic> json) => DepositFiat(
    id: json["id"],
    status: json["status"],
    email: json["email"],
    errors: List<dynamic>.from(json["errors"] .map((x) => x)),
    statusDetails: json["status_details"],
    fromCurrency: json["from_currency"],
    fromNetwork: json["from_network"],
    fromCurrencyWithNetwork: json["from_currency_with_network"],
    fromAmount: json["from_amount"],
    depositType: json["deposit_type"],
    payoutType: json["payout_type"],
    expectedFromAmount: json["expected_from_amount"],
    toCurrency: json["to_currency"],
    toNetwork: json["to_network"],
    toCurrencyWithNetwork: json["to_currency_with_network"],
    toAmount: json["to_amount"],
    outputHash: json["output_hash"],
    expectedToAmount: json["expected_to_amount"],
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    partnerId: json["partner_id"],
    externalPartnerLinkId: json["external_partner_link_id"],
    estimateBreakdown: EstimateBreakdown.fromJson(json["estimate_breakdown"]),
    payout: Payout.fromJson(json["payout"]),
    redirectUrl: json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "email": email,
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "status_details": statusDetails,
    "from_currency": fromCurrency,
    "from_network": fromNetwork,
    "from_currency_with_network": fromCurrencyWithNetwork,
    "from_amount": fromAmount,
    "deposit_type": depositType,
    "payout_type": payoutType,
    "expected_from_amount": expectedFromAmount,
    "to_currency": toCurrency,
    "to_network": toNetwork,
    "to_currency_with_network": toCurrencyWithNetwork,
    "to_amount": toAmount,
    "output_hash": outputHash,
    "expected_to_amount": expectedToAmount,
    "location": location,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "partner_id": partnerId,
    "external_partner_link_id": externalPartnerLinkId,
    "estimate_breakdown": estimateBreakdown.toJson(),
    "payout": payout.toJson(),
    "redirect_url": redirectUrl,
  };
}

class EstimateBreakdown {
  EstimateBreakdown({
    required this.toAmount,
    required this.fromAmount,
    required this.serviceFees,
    required this.convertedAmount,
    required this.estimatedExchangeRate,
    required this.networkFee,
  });

  String toAmount;
  double fromAmount;
  List<ServiceFee> serviceFees;
  ConvertedAmount convertedAmount;
  String estimatedExchangeRate;
  ConvertedAmount networkFee;

  factory EstimateBreakdown.fromJson(Map<String, dynamic> json) => EstimateBreakdown(
    toAmount: json["toAmount"],
    fromAmount: json["fromAmount"].toDouble(),
    serviceFees: List<ServiceFee>.from(json["serviceFees"].map((x) => ServiceFee.fromJson(x))),
    convertedAmount: ConvertedAmount.fromJson(json["convertedAmount"]),
    estimatedExchangeRate: json["estimatedExchangeRate"],
    networkFee: ConvertedAmount.fromJson(json["networkFee"]),
  );

  Map<String, dynamic> toJson() => {
    "toAmount": toAmount,
    "fromAmount": fromAmount,
    "serviceFees": List<dynamic>.from(serviceFees.map((x) => x.toJson())),
    "convertedAmount": convertedAmount.toJson(),
    "estimatedExchangeRate": estimatedExchangeRate,
    "networkFee": networkFee.toJson(),
  };
}

class ConvertedAmount {
  ConvertedAmount({
    required this.amount,
    required this.currency,
  });

  String amount;
  String currency;

  factory ConvertedAmount.fromJson(Map<String, dynamic> json) => ConvertedAmount(
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };
}

class ServiceFee {
  ServiceFee({
    required this.name,
    required this.amount,
    required this.currency,
  });

  String name;
  String amount;
  String currency;

  factory ServiceFee.fromJson(Map<String, dynamic> json) => ServiceFee(
    name: json["name"],
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "currency": currency,
  };
}

class Payout {
  Payout({
    required this.address,
    required this.extraId,
  });

  String address;
  String extraId;

  factory Payout.fromJson(Map<String, dynamic> json) => Payout(
    address: json["address"],
    extraId: json["extra_id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "extra_id": extraId,
  };
}
