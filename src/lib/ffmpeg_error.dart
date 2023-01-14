class FfmpegError {
  static const FfmpegError invalidError = FfmpegError(
    decimalString: '-1',
    hexString: '-1',
    errorCode: '-1',
    error: 'invalid',
  );

  static const String _nilChar = 'ø';
  final String decimalString;
  final String hexString;
  final String errorCode;
  final String error;

  const FfmpegError({
    required this.decimalString,
    required this.hexString,
    required this.errorCode,
    required this.error,
  });

  factory FfmpegError.parse(String decimalString) {
    final String hexString = int.parse(decimalString).abs().toRadixString(16).toUpperCase();
    List<String> errorChars = <String>[];
    // This could easily be a simple lookup based on the decimal value,
    // but I wanted to play with doing the conversion. Converting it like this would also allow
    // doing something silly like dynamically parsing the error codes from the error code file
    // or doc site https://ffmpeg.org/doxygen/2.3/group__lavu__error.html
    for (int i = 0; i < hexString.length; i += 2) {
      int endIndex = i + 2;
      String charCode = endIndex == hexString.length ? hexString.substring(i) : hexString.substring(i, endIndex);
      String errorChar = String.fromCharCode(int.parse(charCode, radix: 16));
      if (errorChar != _nilChar) {
        errorChars.insert(0, errorChar);
      }
    }

    String errorCode = errorChars.join();
    String? errorText = _knownErrors[errorCode];
    return errorText == null
        ? invalidError
        : FfmpegError(
            decimalString: decimalString,
            hexString: hexString,
            errorCode: errorCode,
            error: _knownErrors[errorCode] ?? 'Unknown or invalid error code');
  }

  @override
  String toString() {
    return '$decimalString | 0x$hexString | $errorCode | $error';
  }

  @override
  bool operator ==(Object other) {
    if (other is FfmpegError) {
      return decimalString == other.decimalString &&
          hexString == other.hexString &&
          errorCode == other.errorCode &&
          error == other.error;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(decimalString, hexString, errorCode, error);
}

Map<String, String> _knownErrors = {
  'BSF': 'AVERROR_BSF_NOT_FOUND - Bitstream filter not found',
  'BUG!': 'AVERROR_BUG - Internal bug, also see AVERROR_BUG2',
  'BUFS': 'AVERROR_BUFFER_TOO_SMALL - Buffer too small',
  'DEC': 'AVERROR_DECODER_NOT_FOUND - Decoder not found',
  'DEM': 'AVERROR_DEMUXER_NOT_FOUND - Demuxer not found',
  'ENC': 'AVERROR_ENCODER_NOT_FOUND - Encoder not found',
  'EOF': 'AVERROR_EOF - End of file',
  'EXIT': 'AVERROR_EXIT - Immediate exit was requested; the called function should not be restarted',
  'EXT': 'AVERROR_EXTERNAL - Generic error in an external library',
  'FIL': 'AVERROR_FILTER_NOT_FOUND - Filter not found',
  'INDA': 'AVERROR_INVALIDDATA - Invalid data found when processing input',
  'MUX': 'AVERROR_MUXER_NOT_FOUND - Muxer not found',
  'OPT': 'AVERROR_OPTION_NOT_FOUND - Option not found',
  'PAWE': 'AVERROR_PATCHWELCOME - Not yet implemented in FFmpeg, patches welcome',
  'PRO': 'AVERROR_PROTOCOL_NOT_FOUND - Protocol not found',
  'STR': 'AVERROR_STREAM_NOT_FOUND - Stream not found',
  'BUG': 'AVERROR_BUG2 - Internal bug, also see AVERROR_BUG',
  'UNKN': 'AVERROR_UNKNOWN - Unknown error, typically from an external library',
  '400': 'AVERROR_HTTP_BAD_REQUEST',
  '401': 'AVERROR_HTTP_UNAUTHORIZED',
  '403': 'AVERROR_HTTP_FORBIDDEN',
  '404': 'AVERROR_HTTP_NOT_FOUND',
  '4XX': 'AVERROR_HTTP_OTHER_4XX',
  '5XX': 'AVERROR_HTTP_SERVER_ERROR'
};
