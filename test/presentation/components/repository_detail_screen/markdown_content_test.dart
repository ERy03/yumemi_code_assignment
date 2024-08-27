// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_code_assignment/data/github_readme_repository.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';
import 'package:yumemi_code_assignment/presentation/components/repository_detail_screen/markdown_content.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/error_messages.dart';

void main() {
  DioException dioException(int statusCode) {
    return DioException(
      requestOptions: RequestOptions(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: statusCode,
      ),
    );
  }

  testWidgets(
      'MarkdownContent shows MarkdownBody when getRepositoryReadmeProvider is successful',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            return '# This is a Readme';
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsOne);
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws error',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            throw Exception();
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
    expect(
      find.text(
        LocaleKeys.somethingWentWrong.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws Dio Exception 403',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            throw dioException(403);
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
    expect(
      find.text(
        LocaleKeys.rateLimitExceeded.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws Dio Exception 404',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            throw dioException(404);
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
    expect(
      find.text(
        LocaleKeys.notFound.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws Dio Exception 503',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            throw dioException(503);
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
    expect(
      find.text(
        LocaleKeys.serviceUnavailable.tr(),
      ),
      findsOne,
    );
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws Dio Exception Type connection Error',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getRepositoryReadmeProvider('owner', 'repo').overrideWith((ref) {
            throw DioException(
              requestOptions: RequestOptions(),
              type: DioExceptionType.connectionError,
              response: Response(
                requestOptions: RequestOptions(),
              ),
            );
          }),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MarkdownContent(repo: 'repo', owner: 'owner'),
          ),
        ),
      ),
    );

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
    expect(
      find.text(
        LocaleKeys.networkError.tr(),
      ),
      findsOne,
    );
  });
}
