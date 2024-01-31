class Option {
  final String a;
  final String b;
  final String c;
  final String d;

  Option({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
    );
  }
}
