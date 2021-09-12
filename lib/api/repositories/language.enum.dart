enum LanguageEnum { slovene, croatian, serbian }

extension LanguageEnumValues on LanguageEnum {
  String get language {
    switch (this) {
      case LanguageEnum.slovene:
        return 'sl';
      case LanguageEnum.croatian:
        return 'hr';
      case LanguageEnum.serbian:
        return 'sr';
    }
  }
}
