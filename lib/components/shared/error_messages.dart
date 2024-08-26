import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
              : "Something went wrong", //TODO Localization
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
    return "Rate limit exceeded";
  } else if (error.response?.statusCode == 404) {
    return "Not Found";
  } else if (error.response?.statusCode == 503) {
    return "Service Unavailable";
  } else if (error.type == DioExceptionType.connectionError) {
    return "Network Error";
  }
  return "Something went wrong";
}
