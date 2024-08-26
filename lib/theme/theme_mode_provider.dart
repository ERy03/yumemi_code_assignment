import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferencesのインスタンスがないので, UnimplementedErrorをthrowする
// 参考：https://riverpod.dev/docs/concepts/scopes#initialization-of-synchronous-provider-for-async-apis
final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final themeModeProvider = StateProvider<bool>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final isDarkMode = preferences.getBool('darkMode') ?? false;
  ref.listenSelf((prev, curr) {
    preferences.setBool('darkMode', curr);
  });
  return isDarkMode;
});
