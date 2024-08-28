class Currency {
  final String title;
  final String code;
  final String cbPrice;
  final String? nbuBuyPrice;
  final String? nbuCellPrice;
  final String date;

  Currency({
    required this.title,
    required this.code,
    required this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    required this.date,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      title: json['title'],
      code: json['code'],
      cbPrice: json['cb_price'],
      nbuBuyPrice: json['nbu_buy_price'],
      nbuCellPrice: json['nbu_cell_price'],
      date: json['date'],
    );
  }
}
