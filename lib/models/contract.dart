import 'dart:convert';

List<Contract> contractsFromJson(String str) =>
    List<Contract>.from(json.decode(str).map((x) => Contract.fromMap(x)));

class Contract {
  final String title;
  final String client;
  final String place;
  final num? rate;
  final num? budget;
  final num? daysAgo;
  final bool? payvet;
  final String? xp;

  const Contract({
    required this.title,
    required this.client,
    required this.place,
    this.rate,
    this.budget,
    this.daysAgo,
    this.payvet,
    this.xp,
  });

  factory Contract.fromMap(Map<String, dynamic> json) => Contract(
        title: json['title'],
        client: json['client'],
        place: json['place'],
        rate: json['rate'],
        budget: json['budget'],
        daysAgo: json['daysAgo'],
        payvet: json['payvet'],
        xp: json['xp'],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "client": client,
        "place": place,
        "rate": rate,
        "budget": budget,
        "daysAgo": daysAgo,
        "payvet": payvet,
        "xp": xp,
      };
}
