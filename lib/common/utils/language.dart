class UtilLanguage {
  ///Get Language Global Language Name
  static String getGlobalLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'vi':
        return 'Vietnamese';
      default:
        return 'Unknown language';
    }
  }
}
