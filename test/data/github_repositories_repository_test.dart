// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yumemi_code_assignment/data/github_repositories_repository.dart';
import 'package:yumemi_code_assignment/domain/github_repository_model.dart';
import 'package:yumemi_code_assignment/domain/github_repository_response.dart';

import '../dio_mock.dart';

void main() {
  late GitHubRepositoriesRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = GitHubRepositoriesRepository(mockDio);
  });

  tearDown(() {
    verify(
      () => mockDio.get(
        any(),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).called(1);
    verifyNoMoreInteractions(mockDio);
  });

  group('searchRepositories', () {
    const queryData = (page: 1, query: 'flutter');

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

    final responseData =
        GitHubRepositoryResponse(totalCount: 1, items: [testRepositoryModel]);

    DioException dioException(int statusCode) {
      return DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: statusCode,
        ),
      );
    }

    test('returns GitHubRepositoryResponseModel on successful API call',
        () async {
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

      final result = await repository.searchRepositories(queryData: queryData);

      expect(result, responseData);
      expect(result.totalCount, 1);
      expect(result.items, [testRepositoryModel]);
    });

    test('throws a DioError with status code 403', () async {
      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        ),
      ).thenThrow(dioException(403));

      expect(
        () => repository.searchRepositories(queryData: queryData),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 403),
        ),
      );
    });
    test('throws a DioError with status code 404', () async {
      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        ),
      ).thenThrow(dioException(404));

      expect(
        () => repository.searchRepositories(queryData: queryData),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 404),
        ),
      );
    });
    test('throws a DioError with status code 503', () async {
      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        ),
      ).thenThrow(dioException(503));

      expect(
        () => repository.searchRepositories(queryData: queryData),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 503),
        ),
      );
    });
    test('throws a DioError for connection error', () async {
      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
          response: Response(
            requestOptions: RequestOptions(),
          ),
        ),
      );

      expect(
        () => repository.searchRepositories(queryData: queryData),
        throwsA(
          isA<DioException>().having(
            (e) => e.type,
            'DioExceptionType',
            DioExceptionType.connectionError,
          ),
        ),
      );
    });
  });
}
