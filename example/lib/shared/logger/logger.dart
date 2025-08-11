import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Interface for any external log sink (Datadog, Crashlytics, etc.)
abstract class LogSink {
  /// @no-doc
  void log(String message, {String? tag, LogLevel level});

  /// @no-doc
  void error(
    String message,
    Object error,
    StackTrace stackTrace, {
    String? tag,
  });
}

/// Log levels for filtering or coloring
enum LogLevel {
  /// @no-doc
  debug,

  /// @no-doc
  info,

  /// @no-doc
  warning,

  /// @no-doc
  error
}

/// Singleton Logger
class Logger {
  Logger._();

  /// @no-doc
  static final Logger instance = Logger._();

  final List<LogSink> _externalSinks = [];

  /// @no-doc
  void attach(LogSink sink) {
    _externalSinks.add(sink);
  }

  /// @no-doc
  void debug(String message, {String? tag}) {
    if (kDebugMode) {
      _logInternal(message, tag: tag, level: LogLevel.debug);
    }
  }

  /// @no-doc
  void info(String message, {String? tag}) {
    if (kDebugMode) {
      _logInternal(message, tag: tag, level: LogLevel.info);
    }
  }

  /// @no-doc
  void warn(String message, {String? tag}) {
    if (kDebugMode) {
      _logInternal(message, tag: tag, level: LogLevel.warning);
    }
  }

  /// @no-doc
  void error(
    String message,
    Object error,
    StackTrace stackTrace, {
    String? tag,
  }) {
    _logErrorInternal(message, error, stackTrace, tag: tag);
  }

  void _logInternal(
    String message, {
    required LogLevel level,
    String? tag,
  }) {
    developer.log(message, name: tag ?? 'APP');
    for (final sink in _externalSinks) {
      sink.log(message, tag: tag, level: level);
    }
  }

  void _logErrorInternal(
    String message,
    Object error,
    StackTrace stackTrace, {
    String? tag,
  }) {
    developer.log(
      message,
      name: tag ?? 'APP',
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
    for (final sink in _externalSinks) {
      sink.error(message, error, stackTrace, tag: tag);
    }
  }
}
