import 'package:logger/logger.dart';

final appLogger = Logger(
  printer: PrettyPrinter(
    lineLength: 1024,
    printTime: true,
  ),
);
