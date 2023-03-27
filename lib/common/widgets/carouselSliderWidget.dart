import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yathra/common/assetImages.dart';
import 'package:yathra/common/ui/Ui.dart';
import 'package:yathra/ui/home/homeDetails/homeDetailsPage.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        height: 200,
        viewportFraction: 0.80,
        enlargeCenterPage: true,
      ),
      items: assetImages.map((i) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailsPage(assetImages: i),
                ),
              );
            },
            child: Container(
                height: 450,
                width: 450,
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                padding: const EdgeInsets.all(10.0),
                clipBehavior: Clip.hardEdge,
                decoration: Ui.getBoxDecoration(),
                child: Image.asset(i.image),
            ),
          );
        });
      }).toList(),
    );
  }
}
