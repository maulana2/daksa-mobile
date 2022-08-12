class LoginModels {
  final String? id;
  final String? accountId;
  final String? lastLoginTimestamp;
  final String? sessionStatus;

  LoginModels({
    this.id,
    this.accountId,
    this.lastLoginTimestamp,
    this.sessionStatus,
  });

  LoginModels.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        accountId = json['accountId'] as String?,
        lastLoginTimestamp = json['lastLoginTimestamp'] as String?,
        sessionStatus = json['sessionStatus'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountId': accountId,
        'lastLoginTimestamp': lastLoginTimestamp,
        'sessionStatus': sessionStatus
      };
}
