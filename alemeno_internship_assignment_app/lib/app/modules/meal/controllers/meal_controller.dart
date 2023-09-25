import 'dart:io';
import 'package:alemeno_internship_assignment_app/app/data/firebase_implementation.dart';
import 'package:alemeno_internship_assignment_app/app/data/firebase_use_case.dart';
import 'package:alemeno_internship_assignment_app/app/routes/app_pages.dart';
import 'package:alemeno_internship_assignment_app/app/utils/helpers.dart';
import 'package:alemeno_internship_assignment_app/app/utils/result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class MealController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();

  String _foodName = '';

  Rxn<File> _selectedImage = Rxn<File>();
  Rxn<UploadTask> _uploadTask = Rxn<UploadTask>();
  
  File? get selectedImage => _selectedImage.value;
  UploadTask? get uploadTask => _uploadTask.value;

  set selectedImage(File? selectedImage) =>
      this._selectedImage.value = selectedImage;
  set uploadTask(UploadTask? uploadTask) =>
      this._uploadTask.value = uploadTask;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getImageFromGallery() async {
    var picture = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25
    );

    if (picture?.path != null) {
      selectedImage = File(picture!.path);
      _foodName = picture.name;
    }
  }

  Future getImageFromCamera() async {
    var picture = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50
    );

    if (picture?.path != null) {
      selectedImage = File(picture!.path);
      _foodName = picture.name;
    }
  }

  Future uploadImage() async {
    late FirebaseUseCase upload;
    late Result<dynamic> result;

    UploadParams params = UploadParams(
      foodName: _foodName, 
      uploadTask: uploadTask, 
      selectedImage: selectedImage!
    );

    upload = FirebaseUseCase(firebaseRepository: FirebaseImplementation());

    Get.dialog(
      Obx(() => uploadTask != null 
          ? uploadProgress(uploadTask) 
          : uploadComplete()
      ),
      barrierDismissible: true
    );
    result = await upload.call(params);

    if (result.status is Success) {
      Get.offAllNamed(Routes.FINISH);
      customSnackbar(
        'Yay!', 
        'Thank you for feeding Smilodon and the food has been uploaded to Firebase'
      );
    } else {
      Get.back();
      Get.offAllNamed(Routes.FINISH);
      customSnackbar(
        'Oops!', 
        result.message ?? 'Thank you for feeding Smilodon but the food couldn\'t be uploaded to Firebase'
      );
    }
  }

  Future initiateUpload() async {
    Get.dialog(
      Obx(() => uploadTask != null 
          ? uploadProgress(uploadTask) 
          : uploadComplete()
      ),
      barrierDismissible: true
    );
    
    await uploadImage().then((value) => 
      Get.offAllNamed(Routes.FINISH)
    );
  }
}
