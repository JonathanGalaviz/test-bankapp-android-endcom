class NewCreditCard {
  String? number;
  String? account;
  String? issure;
  String? name;
  String? brand;
  String? status;
  String? balance;
  String? type;

  NewCreditCard(
      {this.number,
      this.account,
      this.issure,
      this.name,
      this.brand,
      this.status,
      this.balance,
      this.type});

  factory NewCreditCard.fromJson(Map<String, dynamic> json) => NewCreditCard(
      number: json['tarjeta'].toString(),
      account: json['cuenta'],
      issure: json['issure'],
      name: json['nombre'],
      brand: json['marca'],
      status: json['estatus'],
      balance: json['saldo'],
      type: json['tipo']);

  Map<String, dynamic> toJson() => {
        'tarjeta': number,
        'cuenta': account,
        'issure': issure,
        'nombre': name,
        'marca': brand,
        'estatus': status,
        'saldo': balance,
        'tipo': type
      };
}
