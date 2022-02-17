import 'dart:convert';

List<Job> jobsFromJson(dynamic str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromMap(x)));

class Job {
  final String title;
  final String client;
  final String place;
  final num? rate;
  final num? budget;
  final String? xp;
  final bool payvet;

  const Job({
    required this.title,
    required this.client,
    required this.place,
    this.rate,
    this.budget,
    this.xp,
    required this.payvet,
  });

  static Job fromMap(Map<String, dynamic> json) => Job(
      title: json['title'],
      client: json['client'],
      place: json['place'],
      rate: json['rate'],
      budget: json['budget'],
      xp: json['xp'],
      payvet: json['payvet']);

  Map<String, dynamic> toMap() => {
        "title": title,
        "client": client,
        "place": place,
        "rate": rate,
        "budget": budget,
        "xp": xp,
        "payvet": payvet
      };
}
