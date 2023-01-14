import 'package:ffmpeg_error_translator/ffmpeg_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('decimal error is translated correctly', () {
    test('invalid data', () {
      String errorCode = "-1094995529";
      FfmpegError error = FfmpegError.parse(errorCode);
      expect(error.errorCode, 'INDA');
      expect(error.error, isNotNull);
    });

    test('option not found', () {
      String errorCode = "1414549496";
      FfmpegError error = FfmpegError.parse(errorCode);
      expect(error.errorCode, 'OPT');
      expect(error.error, isNotNull);
    });

    test('invalid error', () {
      String errorCode = "117";
      FfmpegError error = FfmpegError.parse(errorCode);
      expect(error, FfmpegError.invalidError);
    });
  });
}
