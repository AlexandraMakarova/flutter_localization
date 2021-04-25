class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇦🇷", "Argentino", "arg"),
      Language(3, "🇪🇸", "Castellano", "es"),
      Language(4, "🇧🇷", "Brasileiro", "pt"),
      Language(5, "🇫🇷", "Français", "fr"),
      Language(6, "🇩🇪", "Deutsch", "de"),
      Language(7, "🇷🇺", "Русский", "ru"),
      Language(8, "🇸🇦", "اَلْعَرَبِيَّةُ‎", "ar"),
    ];
  }
}
