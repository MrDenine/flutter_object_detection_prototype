import 'package:flutter/material.dart';
import 'package:flutter_object_detection_prototype/object_detection_ssd_mobilenet/main.dart';

import 'image_classification_mobilenet/main.dart';
import 'live_object_detection_ssd_mobilenet/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Object Detection Project',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Object Detection Prototype'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              title: const Text('Image Classification Mobilenet'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageClassificationMobilenet(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Live Object Detection Mobilenet'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LiveObjectDetectionMobilenet(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Object Detection SSD Mobilenet'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ObjectDetectionSSDMobilenet(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
