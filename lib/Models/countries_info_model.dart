import 'dart:convert';

/// flags : {"png":"https://flagcdn.com/w320/cy.png","svg":"https://flagcdn.com/cy.svg","alt":"The flag of Cyprus has a white field, at the center of which is a copper-colored silhouette of the Island of Cyprus above two green olive branches crossed at the stem."}
/// name : {"common":"Cyprus","official":"Republic of Cyprus","nativeName":{"ell":{"official":"Δημοκρατία της Κύπρος","common":"Κύπρος"},"tur":{"official":"Kıbrıs Cumhuriyeti","common":"Kıbrıs"}}}
/// population : 1207361

CountriesInfoModel countriesInfoModelFromJson(String str) =>
    CountriesInfoModel.fromJson(json.decode(str));
String countriesInfoModelToJson(CountriesInfoModel data) =>
    json.encode(data.toJson());

class CountriesInfoModel {
  CountriesInfoModel({
    Flags? flags,
    Name? name,
    num? population,
  }) {
    _flags = flags;
    _name = name;
    _population = population;
  }

  CountriesInfoModel.fromJson(dynamic json) {
    _flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _population = json['population'];
  }
  Flags? _flags;
  Name? _name;
  num? _population;
  CountriesInfoModel copyWith({
    Flags? flags,
    Name? name,
    num? population,
  }) =>
      CountriesInfoModel(
        flags: flags ?? _flags,
        name: name ?? _name,
        population: population ?? _population,
      );
  Flags? get flags => _flags;
  Name? get name => _name;
  num? get population => _population;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_flags != null) {
      map['flags'] = _flags?.toJson();
    }
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['population'] = _population;
    return map;
  }
}

/// common : "Cyprus"
/// official : "Republic of Cyprus"
/// nativeName : {"ell":{"official":"Δημοκρατία της Κύπρος","common":"Κύπρος"},"tur":{"official":"Kıbrıs Cumhuriyeti","common":"Kıbrıs"}}

Name nameFromJson(String str) => Name.fromJson(json.decode(str));
String nameToJson(Name data) => json.encode(data.toJson());

class Name {
  Name({
    String? common,
    String? official,
    NativeName? nativeName,
  }) {
    _common = common;
    _official = official;
    _nativeName = nativeName;
  }

  Name.fromJson(dynamic json) {
    _common = json['common'];
    _official = json['official'];
    _nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }
  String? _common;
  String? _official;
  NativeName? _nativeName;
  Name copyWith({
    String? common,
    String? official,
    NativeName? nativeName,
  }) =>
      Name(
        common: common ?? _common,
        official: official ?? _official,
        nativeName: nativeName ?? _nativeName,
      );
  String? get common => _common;
  String? get official => _official;
  NativeName? get nativeName => _nativeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['common'] = _common;
    map['official'] = _official;
    if (_nativeName != null) {
      map['nativeName'] = _nativeName?.toJson();
    }
    return map;
  }
}

/// ell : {"official":"Δημοκρατία της Κύπρος","common":"Κύπρος"}
/// tur : {"official":"Kıbrıs Cumhuriyeti","common":"Kıbrıs"}

NativeName nativeNameFromJson(String str) =>
    NativeName.fromJson(json.decode(str));
String nativeNameToJson(NativeName data) => json.encode(data.toJson());

class NativeName {
  NativeName({
    Ell? ell,
    Tur? tur,
  }) {
    _ell = ell;
    _tur = tur;
  }

  NativeName.fromJson(dynamic json) {
    _ell = json['ell'] != null ? Ell.fromJson(json['ell']) : null;
    _tur = json['tur'] != null ? Tur.fromJson(json['tur']) : null;
  }
  Ell? _ell;
  Tur? _tur;
  NativeName copyWith({
    Ell? ell,
    Tur? tur,
  }) =>
      NativeName(
        ell: ell ?? _ell,
        tur: tur ?? _tur,
      );
  Ell? get ell => _ell;
  Tur? get tur => _tur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_ell != null) {
      map['ell'] = _ell?.toJson();
    }
    if (_tur != null) {
      map['tur'] = _tur?.toJson();
    }
    return map;
  }
}

/// official : "Kıbrıs Cumhuriyeti"
/// common : "Kıbrıs"

Tur turFromJson(String str) => Tur.fromJson(json.decode(str));
String turToJson(Tur data) => json.encode(data.toJson());

class Tur {
  Tur({
    String? official,
    String? common,
  }) {
    _official = official;
    _common = common;
  }

  Tur.fromJson(dynamic json) {
    _official = json['official'];
    _common = json['common'];
  }
  String? _official;
  String? _common;
  Tur copyWith({
    String? official,
    String? common,
  }) =>
      Tur(
        official: official ?? _official,
        common: common ?? _common,
      );
  String? get official => _official;
  String? get common => _common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = _official;
    map['common'] = _common;
    return map;
  }
}

/// official : "Δημοκρατία της Κύπρος"
/// common : "Κύπρος"

Ell ellFromJson(String str) => Ell.fromJson(json.decode(str));
String ellToJson(Ell data) => json.encode(data.toJson());

class Ell {
  Ell({
    String? official,
    String? common,
  }) {
    _official = official;
    _common = common;
  }

  Ell.fromJson(dynamic json) {
    _official = json['official'];
    _common = json['common'];
  }
  String? _official;
  String? _common;
  Ell copyWith({
    String? official,
    String? common,
  }) =>
      Ell(
        official: official ?? _official,
        common: common ?? _common,
      );
  String? get official => _official;
  String? get common => _common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = _official;
    map['common'] = _common;
    return map;
  }
}

/// png : "https://flagcdn.com/w320/cy.png"
/// svg : "https://flagcdn.com/cy.svg"
/// alt : "The flag of Cyprus has a white field, at the center of which is a copper-colored silhouette of the Island of Cyprus above two green olive branches crossed at the stem."

Flags flagsFromJson(String str) => Flags.fromJson(json.decode(str));
String flagsToJson(Flags data) => json.encode(data.toJson());

class Flags {
  Flags({
    String? png,
    String? svg,
    String? alt,
  }) {
    _png = png;
    _svg = svg;
    _alt = alt;
  }

  Flags.fromJson(dynamic json) {
    _png = json['png'];
    _svg = json['svg'];
    _alt = json['alt'];
  }
  String? _png;
  String? _svg;
  String? _alt;
  Flags copyWith({
    String? png,
    String? svg,
    String? alt,
  }) =>
      Flags(
        png: png ?? _png,
        svg: svg ?? _svg,
        alt: alt ?? _alt,
      );
  String? get png => _png;
  String? get svg => _svg;
  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['png'] = _png;
    map['svg'] = _svg;
    map['alt'] = _alt;
    return map;
  }
}
