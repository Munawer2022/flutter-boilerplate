class TranslationHelper {
  static String tr(Map<String, dynamic> state, String key, {String defaultValue = ''}) {
    try {
      dynamic value = state['language'];
      dynamic actualValue = value['file_name'];
      String translationValue = actualValue[key];

      
      return translationValue ?? key;
    } catch (e) {
      return key;
    }
  }
} 