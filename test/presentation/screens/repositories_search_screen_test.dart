// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_code_assignment/data/github_repositories_repository.dart';
import 'package:yumemi_code_assignment/domain/github_repository_model.dart';
import 'package:yumemi_code_assignment/domain/github_repository_response.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/custom_search_bar.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/find_prompt.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/no_github_repositories_found.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/repository_list_tile.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/error_messages.dart';
import 'package:yumemi_code_assignment/presentation/screens/repositories_search_screen.dart';
import 'package:yumemi_code_assignment/theme/theme_mode_provider.dart';

import '../../dio_mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  DioException dioException(int statusCode) {
    return DioException(
      requestOptions: RequestOptions(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: statusCode,
      ),
    );
  }

  SharedPreferences.setMockInitialValues({
    'darkMode': false,
  });

  final pref = await SharedPreferences.getInstance();

  testWidgets(
      'RepositoriesSearchScreen shows search bar and FindPrompt when query is empty',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            gitHubRepositorySearchTextStateProvider.overrideWith((ref) {
              return '';
            }),
            sharedPreferencesProvider.overrideWith((ref) => pref),
          ],
          child: const MaterialApp(home: RepositoriesSearchScreen()),
        ),
      );
      // Custom Search bar
      expect(find.byType(CustomSearchBar), findsOne);
      // FindPrompt widget
      expect(find.byType(FindPrompt), findsOne);
      // Find prompt text
      expect(
        find.text(
          LocaleKeys.find.tr(),
        ),
        findsOne,
      );
      expect(
        find.text(
          LocaleKeys.searchRepository.tr(),
        ),
        findsOne,
      );
    });
  });
  testWidgets('RepositoriesSearchScreen shows ErrorMessages Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pump();

    // Circular progress indicator
    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.pumpAndSettle();
    // Make sure Circular progress indicator is gone
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // Check for the presence of the Errors widget
    expect(find.byType(ErrorMessages), findsOne);
  });

  testWidgets(
      'RepositoriesSearchScreen shows NoGitHubRepositoriesFound Widget when total count is 0',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            searchRepositoriesProvider(queryData: (page: 1, query: 'hi'))
                .overrideWith((ref) {
              return const GitHubRepositoryResponse(totalCount: 0, items: []);
            }),
            sharedPreferencesProvider.overrideWith((ref) => pref),
          ],
          child: const MaterialApp(home: RepositoriesSearchScreen()),
        ),
      );

      await tester.enterText(find.byType(CustomSearchBar), 'hi');

      await tester.pumpAndSettle();

      // Check for the presence of the NoGitHubRepositoriesFound widget
      expect(find.byType(NoGitHubRepositoriesFound), findsOne);
      // No repositories text
      expect(
        find.text(
          LocaleKeys.noRepositories.tr(),
        ),
        findsOne,
      );
    });
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Exception',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            throw Exception();
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
    // something went wrong text
    expect(
      find.text(
        LocaleKeys.somethingWentWrong.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Dio Exception 403',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            throw dioException(403);
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
    // rate Limit Exceeded text
    expect(
      find.text(
        LocaleKeys.rateLimitExceeded.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Dio Exception 404',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            throw dioException(404);
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
    // Not found text
    expect(
      find.text(
        LocaleKeys.notFound.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Dio Exception 503',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            throw dioException(503);
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
    // service unavailable text
    expect(
      find.text(
        LocaleKeys.serviceUnavailable.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Dio Exception Type connection Error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            throw DioException(
              requestOptions: RequestOptions(),
              type: DioExceptionType.connectionError,
              response: Response(
                requestOptions: RequestOptions(),
              ),
            );
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
    // network error text
    expect(
      find.text(
        LocaleKeys.networkError.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'RepositoriesSearchScreen shows RepositoryListTile Widget when successful',
      (WidgetTester tester) async {
    final mockDio = MockDio();

    final repository = GitHubRepositoriesRepository(mockDio);

    const testRepositoryJSON = {
      'name': 'Test',
      'html_url': 'test.com',
      'homepage': 'test',
      'stargazers_count': 1,
      'watchers_count': 0,
      'forks_count': 2,
      'open_issues_count': 1,
      'owner': {
        'login': 'test',
        'avatar_url': 'avatarUrl',
        'html_url': 'htmlUrl',
      },
    };

    final testRepositoryModel =
        GitHubRepositoryModel.fromJson(testRepositoryJSON);

    final dioResponseData = {
      'total_count': 1,
      'items': [testRepositoryJSON],
    };

    final responseData = GitHubRepositoryResponse(
      totalCount: 1,
      items: [testRepositoryModel],
    );

    final dioResponse = Response(
      requestOptions: RequestOptions(),
      data: dioResponseData,
      statusCode: 200,
    );

    when(
      () => mockDio.get(
        any(),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async => dioResponse);

    final result =
        await repository.searchRepositories(queryData: (page: 1, query: 'hi'));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
            return repository;
          }),
          sharedPreferencesProvider.overrideWith((ref) => pref),
        ],
        child: const MaterialApp(home: RepositoriesSearchScreen()),
      ),
    );

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pump();

    // Circular progress indicator

    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.pumpAndSettle();

    // Circular progress indicator gone
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Check for the presence of RepositoryListTile widget
    expect(find.byType(RepositoryListTile), findsOne);

    expect(result, responseData);
    expect(result.totalCount, 1);
    expect(result.items, [testRepositoryModel]);

    verify(
      () => mockDio.get(
        any(),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).called(2);
    verifyNoMoreInteractions(mockDio);
  });
}
