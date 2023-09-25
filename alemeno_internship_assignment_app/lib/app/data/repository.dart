import 'package:alemeno_internship_assignment_app/app/data/firebase_use_case.dart';
import 'package:alemeno_internship_assignment_app/app/utils/result.dart';

abstract class FirebaseRepository {
  Future<Result<dynamic>> upload({
    required UploadParams params
  });
}