import 'package:alemeno_internship_assignment_app/app/data/firebase_use_case.dart';
import 'package:alemeno_internship_assignment_app/app/data/repository.dart';
import 'package:alemeno_internship_assignment_app/app/utils/result.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImplementation extends FirebaseRepository {
  @override
  Future<Result<dynamic>> upload({
    required UploadParams params
  }) async {
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

    try {
      final path = 'foods/${params.foodName}';
      final ref = _firebaseStorage.ref().child(path);
      params.uploadTask = ref.putFile(params.selectedImage);
      final snapshot = await params.uploadTask!.whenComplete(() {});
      params.uploadTask = null;

      String imageUrl = await snapshot.ref.getDownloadURL();
      print(imageUrl);
      return Result.success(
        imageUrl,
        message: 'Food uploaded!'
      );
    } catch(e) {
      return Result.error(
        message: e.toString()
      );
    }
  }
}