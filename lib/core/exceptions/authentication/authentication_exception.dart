import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';

class AuthenticationFailException extends BaseException{
  AuthenticationFailException(super.reason);

}