import 'package:movies/core/utils/app/app_regex.dart.dart';

int movieIndex(String? indexSend) {
  if (indexSend == null) {
    return -1;
  } else {
    if (AppRegex.hasSpecialCharacter(indexSend)) {
      return -1;
    }
    return isNumeric(indexSend) ? int.parse(indexSend) : -1;
  }
}

bool isNumeric(String str) {
  try {
    double.parse(str);
    return true;
  } on FormatException {
    return false;
  }
}
