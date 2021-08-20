import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProjectUsecase {
  Future<Either<Failure, List<Project>>> getAll();
}
