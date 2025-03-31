import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  final bool useDialog;

  ErrorHandler({this.useDialog = false});

  void handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = _getErrorMessage(error);

    if (statusCode == 401) {
      _showAuthError(message);
    } else if (_isConnectionError(error)) {
      _showNotification(
        message,
        icon: Icons.signal_wifi_off,
        color: Colors.orange,
        actionLabel: 'Retry',
      );
    } else {
      _showNotification(message, color: Colors.red);
    }
  }

  void handleGenericError(String message) {
    _showNotification(message, color: Colors.red);
  }

  String _getErrorMessage(DioException error) {
    // Extract message from response if available
    if (error.response?.data is Map<String, dynamic>) {
      final data = error.response?.data as Map<String, dynamic>;
      if (data.containsKey('message')) return data['message'];
      if (data.containsKey('error')) return data['error'];
    }

    // Handle error types
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return _getStatusCodeMessage(statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return 'No internet connection';
        }
        return 'An unexpected error occurred';
      default:
        return 'Network error: ${error.message}';
    }
  }

  String _getStatusCodeMessage(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Authentication failed. Please login again.';
      case 403:
        return 'You do not have permission to access this resource.';
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Server error (${statusCode ?? "unknown"})';
    }
  }

  bool _isConnectionError(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError ||
        (error.error is SocketException);
  }

  void _showAuthError(
    String message, {
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    if (navigatorKey?.currentContext == null) return;

    if (useDialog) {
      showDialog(
        context: navigatorKey!.currentContext!,
        builder:
            (context) => AlertDialog(
              title: const Text('Authentication Error'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Dismiss'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate to login: Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
      );
    } else {
      _showNotification(message, navigatorKey: navigatorKey, color: Colors.red);
    }
  }

  void _showNotification(
    String message, {
    GlobalKey<NavigatorState>? navigatorKey,
    IconData? icon,
    Color color = Colors.red,
    String actionLabel = 'Dismiss',
  }) {
    if (navigatorKey?.currentContext == null) return;

    ScaffoldMessenger.of(navigatorKey!.currentContext!).showSnackBar(
      SnackBar(
        content:
            icon != null
                ? Row(
                  children: [
                    Icon(icon, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(child: Text(message)),
                  ],
                )
                : Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: actionLabel,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
