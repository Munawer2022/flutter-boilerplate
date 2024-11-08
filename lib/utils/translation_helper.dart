class TranslationHelper {
  static String tr(Map<String, dynamic> state, String key, {String defaultValue = ''}) {
    try {
      List<String> keys = key.split('.');
      dynamic value = state['language'];
      
      for (String k in keys) {
        value = value[k];
      }
      
      return value?.toString() ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }
} 