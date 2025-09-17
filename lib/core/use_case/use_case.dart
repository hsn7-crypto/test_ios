import 'package:test_ios/core/errors/error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Either<Failure, Type> call([Param? param]);
}

class NoParam {}
