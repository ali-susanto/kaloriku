import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import '../../main.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({Key? key}) : super(key: key);

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  CameraController? cameraController;
  CameraImage? cameraImage;
  List? recognitionList;

  initCamera() {
    cameraController = CameraController(camera[0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      setState(() {
        cameraController!.startImageStream((image) => {
              cameraImage = image,
              runModel(),
            });
      });
    });
  }

  runModel() async {
    recognitionList = await Tflite.detectObjectOnFrame(
      bytesList: cameraImage!.planes.map((e) {
        return e.bytes;
      }).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
      threshold: 0.4,
    );
    setState(() {
      cameraImage;
    });
  }

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/models/ssd_mobilenet.tflite",
        labels: "assets/models/ssd_mobilenet.txt");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController!.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
    initCamera();
  }

  List<Widget> showBoxInImage(Size size) {
    if (recognitionList == null) return [];

    double factorX = size.width;
    double factorY = size.height;

    Color colorPicked = Colors.blueAccent;

    return recognitionList!.map((result) {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        right: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 2, color: Colors.blueAccent)),
          child: Text(
            "${result['detectedClass']} ${(result['confidentClass'] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
                background: Paint()..color = colorPicked,
                color: Colors.black,
                fontSize: 18),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> list = [];

    list.add(Positioned(
        left: 0.0,
        top: 0.0,
        width: size.width,
        height: size.height - 100,
        child: Container(
          height: size.height - 100,
          child: (!cameraController!.value.isInitialized)
              ? new Container()
              : AspectRatio(
                  aspectRatio: cameraController!.value.aspectRatio,
                  child: CameraPreview(cameraController!),
                ),
        )));

    if (cameraImage != null) {
      list.addAll(showBoxInImage(size));
    }
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 50),
        color: Colors.black,
        child: Stack(
          children: list,
        ),
      )),
    );
  }
}
