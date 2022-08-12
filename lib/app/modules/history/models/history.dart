class HistoryModels {
  HistoryModels({
    required this.id,
    required this.accountSrcId,
    required this.accountDstId,
    required this.clientRef,
    required this.amount,
    required this.transactionTimestamp,
  });
  late final String id;
  late final String accountSrcId;
  late final String accountDstId;
  late final String clientRef;
  late final double amount;
  late final String transactionTimestamp;

  HistoryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountSrcId = json['accountSrcId'];
    accountDstId = json['accountDstId'];
    clientRef = json['clientRef'];
    amount = json['amount'];
    transactionTimestamp = json['transactionTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['accountSrcId'] = accountSrcId;
    _data['accountDstId'] = accountDstId;
    _data['clientRef'] = clientRef;
    _data['amount'] = amount;
    _data['transactionTimestamp'] = transactionTimestamp;
    return _data;
  }
}
