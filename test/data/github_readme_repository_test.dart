// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yumemi_code_assignment/data/github_readme_repository.dart';

import '../dio_mock.dart';

void main() {
  late GithubReadmeRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = GithubReadmeRepository(mockDio);
  });

  tearDown(() {
    verify(() => mockDio.get(any(), options: any(named: 'options'))).called(1);
    verifyNoMoreInteractions(mockDio);
  });

  group('getRepositoryReadme', () {
    const mockResponseData = '# This is a Readme';
    const owner = 'test';
    const repo = 'test repo';

    DioException dioException(int statusCode) {
      return DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: statusCode,
        ),
      );
    }

    test('returns the README content on successful API call', () async {
      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: mockResponseData,
        statusCode: 200,
      );

      when(() => mockDio.get(any(), options: any(named: 'options')))
          .thenAnswer((_) async => dioResponse);

      final result =
          await repository.getRepositoryReadme(owner: owner, repo: repo);

      expect(result, mockResponseData);
    });

    test('throws a DioError with status code 403', () async {
      when(() => mockDio.get(any(), options: any(named: 'options')))
          .thenThrow(dioException(403));

      expect(
        () => repository.getRepositoryReadme(owner: owner, repo: repo),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 403),
        ),
      );
    });
    test('throws a DioError with status code 404', () async {
      when(() => mockDio.get(any(), options: any(named: 'options')))
          .thenThrow(dioException(404));

      expect(
        () => repository.getRepositoryReadme(owner: owner, repo: repo),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 404),
        ),
      );
    });
    test('throws a DioError with status code 503', () async {
      when(() => mockDio.get(any(), options: any(named: 'options')))
          .thenThrow(dioException(503));

      expect(
        () async => repository.getRepositoryReadme(owner: owner, repo: repo),
        throwsA(
          isA<DioException>()
              .having((e) => e.response?.statusCode, 'statusCode', 503),
        ),
      );
    });
    test('throws a DioError for connection error', () async {
      when(() => mockDio.get(any(), options: any(named: 'options'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
          response: Response(
            requestOptions: RequestOptions(),
          ),
        ),
      );

      expect(
        () async => repository.getRepositoryReadme(owner: owner, repo: repo),
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
