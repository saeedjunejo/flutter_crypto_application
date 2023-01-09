class ExchApiModel {
  ExchApiModel({
    required this.estdAmount,
    required this.tranSpeed,
    required this.warMessage,
  });

  final double estdAmount;
  final String tranSpeed;
  final String warMessage;

  factory ExchApiModel.fromJson(Map<String, dynamic> json) => ExchApiModel(
    estdAmount: json["estimatedAmount"] ?? "",
    tranSpeed: json["transactionSpeedForecast"] ?? "",
    warMessage: json["warningMessage"] ?? "",

  );
}
