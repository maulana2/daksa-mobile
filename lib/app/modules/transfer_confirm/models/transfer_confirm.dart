class TransferConfirmModels {
  TransferConfirmModels({
    required this.accountSrcId,
    required this.accountDstId,
    required this.amount,
    required this.transactionTimestamp,
    required this.clientRef,
  });
  late final String accountSrcId;
  late final String accountDstId;
  late final int amount;
  late final String transactionTimestamp;
  late final String clientRef;

  TransferConfirmModels.fromJson(Map<String, dynamic> json) {
    accountSrcId = json['accountSrcId'];
    accountDstId = json['accountDstId'];
    amount = json['amount'];
    transactionTimestamp = json['transactionTimestamp'];
    clientRef = json['clientRef'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountSrcId'] = accountSrcId;
    _data['accountDstId'] = accountDstId;
    _data['amount'] = amount;
    _data['transactionTimestamp'] = transactionTimestamp;
    _data['clientRef'] = clientRef;
    return _data;
  }
}
