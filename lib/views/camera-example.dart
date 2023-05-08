import 'dart:io';
import 'package:flutter/material.dart';
/*import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

//void main() => runApp(MyApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera & Gallery Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  String? _imagePath;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras.isNotEmpty) {
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller?.initialize();
      setState(() {});
    }
  }

  Future<void> _takePicture() async {
    final image = await _controller?.takePicture();
    setState(() {
      _imagePath = image?.path;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imagePath = pickedFile?.path;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera & Gallery Demo')),
      body: Center(
        child: _imagePath == null
            ? Text('No image selected.')
            : Image.file(File(_imagePath??'')),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _controller != null ? _takePicture : null,
            tooltip: 'Take Picture',
            child: Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            onPressed: _pickImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
*/