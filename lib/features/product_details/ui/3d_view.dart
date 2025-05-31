import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ThreeDViewer extends StatefulWidget {
  const ThreeDViewer({super.key});

  @override
  State<ThreeDViewer> createState() => _ThreeDViewerState();
}

class _ThreeDViewerState extends State<ThreeDViewer> {
  String? glbBase64;

  @override
  void initState() {
    super.initState();
    loadGLB();
  }

  Future<void> loadGLB() async {
    final bytes = await rootBundle.load('assets/models/ch.glb');
    final buffer = bytes.buffer.asUint8List();
    final base64GLB = base64Encode(buffer);
    setState(() {
      glbBase64 = base64GLB;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D View"),
      ),
      body: glbBase64 == null
          ? const Center(child: CustomLoadingWidget())
          : ModelViewer(
              src: 'data:model/gltf-binary;base64,$glbBase64',
              alt: "3D model",
              ar: true,
              autoRotate: true,
              cameraControls: true,
            ),
    );
  }
}
