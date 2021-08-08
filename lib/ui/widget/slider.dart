import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';

typedef OnUploadFile = void Function(File file);

class SliderWidget extends StatefulWidget {
  final List<String> imagesUrls;
  final OnUploadFile onUploadFile;

  const SliderWidget({Key key, this.imagesUrls, this.onUploadFile})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Slider();
  }
}

class _Slider extends State<SliderWidget> {
  List uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.black,
      indicatorBackgroundColor: Colors.grey,
      children: [
        ...widget.imagesUrls
            .map((url) => Image.network(url, fit: BoxFit.cover))
            .toList(),
        ...uploadedImages,
        Card(
            color: Colors.black,
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 50),
              onPressed: uploadImg,
            )),
      ],
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      autoPlayInterval: 5000,
    );
  }

  Future uploadImg() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(imageFile.path);
    setState(() {
      uploadedImages.add(Image.file(file));
    });
    if (widget.onUploadFile != null) widget.onUploadFile(file);
  }
}
