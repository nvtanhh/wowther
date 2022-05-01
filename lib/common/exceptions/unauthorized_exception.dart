import '../constants/exception_constants.dart';
import 'server_exception.dart';

class UnauthorizedException extends ServerException {
  UnauthorizedException(String message)
      : super(
          message: message,
          code: ExceptionConstants.unauthorized,
        );
}
