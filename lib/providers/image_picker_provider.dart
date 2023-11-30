import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Defining a class for image picking functionality
class ImagePickerProvider {
  File? _pickedImage;

  void pickImage(File image) {
    _pickedImage = image;
  }

  File? get pickedImage => _pickedImage;
}

final imageProvider = Provider((ref) => ImagePickerProvider());
