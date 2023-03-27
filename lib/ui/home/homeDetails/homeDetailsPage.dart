import 'package:flutter/material.dart';
import 'package:yathra/common/assetImages.dart';

class HomeDetailsPage extends StatelessWidget {

  final AssetImages assetImages;
  const HomeDetailsPage({Key? key, required this.assetImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(assetImages.image)),
    );
  }
}
