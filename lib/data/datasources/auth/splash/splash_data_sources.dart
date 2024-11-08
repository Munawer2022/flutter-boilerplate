import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDataSources extends Cubit<Map<String, dynamic>> {
  String currentLang = 'en';

  SplashDataSources() : super({});
  setSplashDataSources({required Map<String, dynamic> systemSettings}) =>
      emit(systemSettings);

  Future<void> clearUserData() async {
    try {
      // Clear user preferences/token
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();  // This clears all stored preferences
      
      // Or if you want to clear specific items only:
      // await prefs.remove('token');
      // await prefs.remove('user_data');
      // await prefs.remove('isLoggedIn');
      
      // Reset any state variables
      dynamic state = {};  // Clear the state map
      // currentLang = 'en';  // Reset to default language
      
      // Emit state change if using Cubit/Bloc
      emit(state);
    } catch (e) {
      print('Error clearing user data: $e');
    }
  }
}
