import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';

class ErrorMessages extends StatelessWidget {
  const ErrorMessages(
      {super.key, required this.error, required this.onPressed});

  final Object error;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDioException = error is DioException;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isDioException
              ? handleDioError(error as DioException)
              : LocaleKeys.somethingWentWrong.tr(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
        ),
        IconButton(
            onPressed: onPressed, icon: const Icon(Icons.refresh_outlined))
      ],
    ));
  }
}

String handleDioError(DioException error) {
  if (error.response?.statusCode == 403) {
    return LocaleKeys.rateLimitExceeded.tr();
  } else if (error.response?.statusCode == 404) {
    return LocaleKeys.notFound.tr();
  } else if (error.response?.statusCode == 503) {
    return LocaleKeys.serviceUnavailable.tr();
  } else if (error.type == DioExceptionType.connectionError) {
    return LocaleKeys.networkError.tr();
  }
  return LocaleKeys.somethingWentWrong.tr();
}
