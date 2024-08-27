// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:yumemi_code_assignment/data/github_language_colors_repository.dart';
import 'package:yumemi_code_assignment/domain/github_language_colors.dart';

import '../dio_mock.dart';

void main() {
  late GitHubLanguageColorsRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = GitHubLanguageColorsRepository(mockDio);
  });

  tearDown(() {
    verify(() => mockDio.get(any())).called(1);
    verifyNoMoreInteractions(mockDio);
  });

  group('getLanguageColors', () {
    const dioResponseData = '''
    {
      "1C Enterprise": {
          "color": "#814CCC",
          "url": "https://github.com/trending?l=1C-Enterprise"
      },
      "2-Dimensional Array": {
          "color": "#38761D",
          "url": "https://github.com/trending?l=2-Dimensional-Array"
      },
      "test": {
          "color": null,
          "url": "test"
      },
      "4D": {
          "color": "#004289",
          "url": "https://github.com/trending?l=4D"
      }
    }
    ''';

    const responseData = [
      GitHubLanguageColors(name: '1C Enterprise', color: '#814CCC'),
      GitHubLanguageColors(name: '2-Dimensional Array', color: '#38761D'),
      GitHubLanguageColors(name: 'test', color: null),
      GitHubLanguageColors(name: '4D', color: '#004289'),
    ];

    DioException dioException(int statusCode) {
      return DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: statusCode,
        ),
      );
    }

    test('returns a list of GitHubLanguageColors on successful API call',
        () async {
      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: dioResponseData,
        statusCode: 200,
      );

      when(() => mockDio.get(any())).thenAnswer((_) async => dioResponse);

      final result = await repository.getLanguageColors();

      expect(result, responseData);
      expect(result.length, 4);
    });

    test('throws a DioError with status code 403', () {
      when(() => mockDio.get(any())).thenThrow(dioException(403));

      expect(
        () => repository.getLanguageColors(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            403,
          ),
        ),
      );
    });
    test('throws a DioError with status code 404', () {
      when(() => mockDio.get(any())).thenThrow(dioException(404));

      expect(
        () => repository.getLanguageColors(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            404,
          ),
        ),
      );
    });
    test('throws a DioError with status code 503', () async {
      when(() => mockDio.get(any())).thenThrow(dioException(503));

      expect(
        () => repository.getLanguageColors(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            503,
          ),
        ),
      );
    });
    test('throws a DioError for connection error', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
          response: Response(
            requestOptions: RequestOptions(),
          ),
        ),
      );

      expect(
        () => repository.getLanguageColors(),
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
