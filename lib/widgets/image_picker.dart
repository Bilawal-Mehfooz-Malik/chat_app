import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/providers/image_picker_provider.dart';

class UserImagePicker extends ConsumerStatefulWidget {
  const UserImagePicker({super.key});

  @override
  ConsumerState<UserImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends ConsumerState<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      maxWidth: 150,
      source: ImageSource.camera,
    );

    if (pickedImage == null) return;

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    ref.read(imageProvider).pickImage(_pickedImageFile!);
  }

  void _pickGalleryImage() async {
    final pickedImage = await ImagePicker().pickImage(
      maxWidth: 150,
      source: ImageSource.gallery,
    );

    if (pickedImage == null) return;

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    ref.read(imageProvider).pickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // From camera picker
            TextButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: Text(
                'From Camera',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            // From gallery picker
            TextButton.icon(
              onPressed: _pickGalleryImage,
              icon: const Icon(Icons.image),
              label: Text(
                'From Gallery',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
