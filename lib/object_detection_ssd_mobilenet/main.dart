import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_object_detection_prototype/object_detection_ssd_mobilenet/object_detection.dart';
import 'package:image_picker/image_picker.dart';

class ObjectDetectionSSDMobilenet extends StatefulWidget {
  const ObjectDetectionSSDMobilenet({super.key});

  @override
  State<ObjectDetectionSSDMobilenet> createState() => _ObjectDetectionSSDMobilenetState();
}

class _ObjectDetectionSSDMobilenetState extends State<ObjectDetectionSSDMobilenet> {
  final imagePicker = ImagePicker();

  ObjectDetection? objectDetection;

  Uint8List? image;

  @override
  void initState() {
    super.initState();
    objectDetection = ObjectDetection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/tfl_logo.png'),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: (image != null) ? Image.memory(image!) : Container(),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await imagePicker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (result != null) {
                        image = objectDetection!.analyseImage(result.path);
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.camera,
                      size: 64,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (result != null) {
                        image = objectDetection!.analyseImage(result.path);
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.photo,
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
