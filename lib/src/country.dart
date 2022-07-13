class Country {
  ///The country code
  final String code;

  ///The country name in English
  final String name;

  ///The currency code
  final String currencyCode;

  Country({
    required this.code,
    required this.name,
    required this.currencyCode,
  });

  Country.from({required Map<String, dynamic> json})
      : code = json['countryCode'],
        name = json['countryName'],
        currencyCode = json['currencyCode'];

  Map<String, dynamic> toJson() => {
        'countryCode': code,
        'countryName': name,
        'currencyCode': currencyCode,
      };
}
