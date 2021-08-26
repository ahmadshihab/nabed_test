import 'package:flutter/material.dart';
import 'package:nabed_test/config/colors.dart';
import 'package:nabed_test/model/image_card/image_card.dart';

class ImageDetailPage extends StatelessWidget {
  final ImageCard image;

  const ImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: Hero(
              tag: image.id.toString(),
              child: Image.network(image.userImageURL!))),
    );
  }
}
