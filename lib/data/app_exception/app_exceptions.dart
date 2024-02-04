class AppExceptions implements Exception {
  final _msg;

  AppExceptions([this._msg]);

  String toString() {
    return '$_msg';
  }
}

class InternetException extends AppExceptions {
  InternetException() : super("No Internet Connection");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut() : super("Request Time Is Out");
}

class NullPointerException extends AppExceptions {
  NullPointerException() : super("Null Point Error!");
}

class InvalidDataTypeException extends AppExceptions {
  InvalidDataTypeException() : super("Invalid Datatype");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException() : super("Invalid URL");
}

class InputDataException extends AppExceptions {
  InputDataException() : super("Invalid username or password");
}

class FetchDataException extends AppExceptions {
  FetchDataException() : super("Error while communication!");
}

class TimeOutException extends AppExceptions{
  TimeOutException() : super("Request time out");
}
