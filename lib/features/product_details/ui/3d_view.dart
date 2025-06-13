import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ThreeDViewer extends StatelessWidget {
  final String modelUrl;

  const ThreeDViewer({super.key, required this.modelUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("3D View")),
      body: ModelViewer(
        src: modelUrl,                // هنا بتدي الرابط مباشرة
        alt: "3D model",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
