import 'dart:io';

import 'package:alemeno_internship_assignment_app/app/data/repository.dart';
import 'package:alemeno_internship_assignment_app/app/utils/result.dart';
import 'package:alemeno_internship_assignment_app/app/utils/use_case.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadParams {
  final String foodName;
  UploadTask? uploadTask;
  final File selectedImage;

  UploadParams({ 
    required this.foodName, 
    required this.uploadTask, 
    required this.selectedImage 
  });
}

class FirebaseUseCase extends UseCase<dynamic, UploadParams> {
  final FirebaseRepository firebaseRepository;

  FirebaseUseCase({ required this.firebaseRepository });

  @override
  Future<Result<dynamic>> call(UploadParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return firebaseRepository.upload(params: params);
    }
  }
}