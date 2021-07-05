import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerImage extends StatefulWidget {
  final Function pickedImage;

  PickerImage(this.pickedImage);

  @override
  _PickerImageState createState() => _PickerImageState();
}

class _PickerImageState extends State<PickerImage> {
  File? _image;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _image = pickedImageFile;
    });
    widget.pickedImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _pickImage,
          child: Icon(
            CupertinoIcons.camera,
          ),
        ),
      ],
    );
  }
}
