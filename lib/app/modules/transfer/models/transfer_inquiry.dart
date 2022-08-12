class TransferInquiry {
  TransferInquiry({
    required this.inquiryId,
    required this.accountSrcId,
    required this.accountDstId,
    required this.accountSrcName,
    required this.accountDstName,
    required this.amount,
  });
  late final String inquiryId;
  late final String accountSrcId;
  late final String accountDstId;
  late final String accountSrcName;
  late final String accountDstName;
  late final int amount;

  TransferInquiry.fromJson(Map<String, dynamic> json) {
    inquiryId = json['inquiryId'];
    accountSrcId = json['accountSrcId'];
    accountDstId = json['accountDstId'];
    accountSrcName = json['accountSrcName'];
    accountDstName = json['accountDstName'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['inquiryId'] = inquiryId;
    _data['accountSrcId'] = accountSrcId;
    _data['accountDstId'] = accountDstId;
    _data['accountSrcName'] = accountSrcName;
    _data['accountDstName'] = accountDstName;
    _data['amount'] = amount;
    return _data;
  }
}
