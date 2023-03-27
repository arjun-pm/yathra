import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yathra/common/widgets/carouselSliderWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height:20),
            itemName("Discover"),
            const CarouselSliderWidget(),
            itemName("Explore more"),
          ],
        ),
      ),
    );
  }

  Widget itemName(String name){
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(name,
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
