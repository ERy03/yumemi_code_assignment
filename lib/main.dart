import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_code_assignment/presentation/screens/repositories_search_screen.dart';
import 'package:yumemi_code_assignment/theme/theme_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    // ここでUnimplementedErrorを実際のSharedPreferencesのインスタンスと上書きする
    sharedPreferencesProvider.overrideWithValue(prefs),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeModeState ? ThemeData.dark() : ThemeData.light(),
      home: const RepositoriesSearchScreen(),
    );
  }
}
