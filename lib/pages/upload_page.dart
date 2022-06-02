import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  ImagePicker picker = ImagePicker();
  late PickedFile image;
  int digit = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[300],
        child: Icon(Icons.camera_alt_rounded),
        onPressed: () async {
          digit = 1;
          image = (await picker.pickImage(
            source: ImageSource.gallery,
            maxHeight: 300,
            maxWidth: 300,
            imageQuality: 100,
          )) as PickedFile;

          setState(() {});
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Center(child: Text("Digit Recognizer")),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20, width: 10),
            Text(
              "Image will be shown below",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20, width: 10),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
                //If digit = -1 then use image from assets/images/white.jpg else use image from gallery
                image: digit == -1
                    ? DecorationImage(
                        image: AssetImage("assets/images/white.jpg"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: FileImage(File(image.path)),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 40, width: 10),
            Text(
              "Current Prediction",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("5",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
