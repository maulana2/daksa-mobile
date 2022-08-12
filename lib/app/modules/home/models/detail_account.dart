
class DetailAccount {
  String? id;
  String? name;
  String? username;
  double? balance;

  DetailAccount({
    this.id,
    this.name,
    this.username,
    this.balance,
  });

  DetailAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    username = json['username'] as String?;
    balance = json['balance'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['username'] = username;
    json['balance'] = balance;
    return json;
  }
}
