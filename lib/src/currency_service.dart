import 'package:collection/collection.dart' show IterableExtension;
import 'package:currency_picker/src/countries.dart';
import 'package:currency_picker/src/country.dart';
import 'package:currency_picker/src/currencies.dart';
import 'package:currency_picker/src/currency.dart';

class CurrencyService {
  final List<Currency> _currencies;
  final List<Country> _countries;

  CurrencyService()
      : _currencies = currencies
            .map((currency) => Currency.from(json: currency))
            .toList(),
        _countries =
            countries.map((country) => Country.from(json: country)).toList();

  ///Return list with all currencies
  List<Currency> getAll() {
    return _currencies;
  }

  ///Returns the first currency that mach the given code.
  Currency? findByCode(String? code) {
    final uppercaseCode = code?.toUpperCase();
    return _currencies
        .firstWhereOrNull((currency) => currency.code == uppercaseCode);
  }

  ///Returns the first currency that mach the given name.
  Currency? findByName(String? name) {
    return _currencies.firstWhereOrNull((currency) => currency.name == name);
  }

  ///Returns the first currency that mach the given number.
  Currency? findByNumber(int? number) {
    return _currencies
        .firstWhereOrNull((currency) => currency.number == number);
  }

  ///Returns the first currency that mach the given number.
  Currency? findByCountry(String countryCode) {
    final country =
        _countries.firstWhereOrNull((country) => country.code == countryCode);
    if (country == null) {
      return null;
    }
    return _currencies
        .firstWhereOrNull((currency) => currency.code == country.currencyCode);
  }

  ///Returns a list with all the currencies that mach the given codes list.
  List<Currency> findCurrenciesByCode(List<String> codes) {
    final List<String> _codes =
        codes.map((code) => code.toUpperCase()).toList();
    final List<Currency> currencies = [];
    for (final code in _codes) {
      final Currency? currency = findByCode(code);
      if (currency != null) {
        currencies.add(currency);
      }
    }
    return currencies;
  }
}
