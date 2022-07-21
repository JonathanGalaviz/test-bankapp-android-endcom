class CreditCard {
  int? id;
  String? number;
  String? name;
  double? balance;
  String? status;
  String? type;

  CreditCard(
      {this.id, this.number, this.name, this.balance, this.status, this.type});

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
      id: json['id'],
      number: json['tarjeta'].toString(),
      name: json['nombre'],
      balance: double.parse(json['saldo'].toString()),
      status: json['estado'],
      type: json['tipo']);
}
