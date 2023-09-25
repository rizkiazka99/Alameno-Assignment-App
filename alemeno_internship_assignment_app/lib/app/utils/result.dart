abstract class Status {
  static var success = Success();
  static var noInternet = NoInternet();
  static var error = Error();
}

class Success extends Status {}

class NoInternet extends Status {}

class Error extends Status {}

class Result<T> {
  late T data;
  late Status status;
  late String errCode;

  int code;
  String? message;

  Result.success(
    this.data, {
    this.message = "",
    this.code = 200,
  }) : status = Status.success;

  Result.noInternet({
    this.message = "Thank you for feeding Smilodon but there's No Internet Connection, therefore the food couldn't be uploaded to Firebase",
    this.code = -1,
  }) : status = Status.noInternet;

  Result.error({
    Status? status,
    this.message = "",
    this.code = 400,
  }) : status = status ?? Status.error;
}