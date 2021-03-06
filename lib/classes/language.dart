class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "๐บ๐ธ", "English", "en"),
      Language(2, "๐ฆ๐ท", "Argentino", "arg"),
      Language(3, "๐ช๐ธ", "Castellano", "es"),
      Language(4, "๐ง๐ท", "Brasileiro", "pt"),
      Language(5, "๐ซ๐ท", "Franรงais", "fr"),
      Language(6, "๐ฉ๐ช", "Deutsch", "de"),
      Language(7, "๐ท๐บ", "ะ ัััะบะธะน", "ru"),
      Language(8, "๐ธ๐ฆ", "ุงูููุนูุฑูุจููููุฉูโ", "ar"),
    ];
  }
}
