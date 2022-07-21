class Movement {
  int? id;
  String? date;
  String? description;
  double? amount;
  String? type;

  Movement({this.id, this.date, this.description, this.amount, this.type});

  factory Movement.fromJson(Map<String, dynamic> json) => Movement(
      id: json['id'],
      date: json['fecha'],
      description: json['descripcion'].toString(),
      amount: double.parse(json['monto'].toString()),
      type: json['tipo']);
}
