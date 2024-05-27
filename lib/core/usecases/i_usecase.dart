import 'package:dartz/dartz.dart';

import '../error/exception.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<ConnectException, SuccessType>> call(Params params);
}

class NoParams {}
