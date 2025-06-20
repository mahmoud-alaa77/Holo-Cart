import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ThreeDViewer extends StatelessWidget {
  final String modelUrl;
  final String title;

  const ThreeDViewer({super.key, required this.modelUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("3D View for $title")),
      body: ModelViewer(
        src: modelUrl,                
        alt: "3D model",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
