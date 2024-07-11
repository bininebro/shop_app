import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIdx) {
            return SizedBox(
              width: double.infinity,
              child: Image.asset(
                imgList[index],
                fit: BoxFit.fitWidth,
              ),
            );
          },
          options: CarouselOptions(
            disableCenter: true,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 1.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: _current == index ? 16.0 : 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _current == index
                      ? const Color.fromRGBO(255, 255, 255, 0.9)
                      : const Color.fromRGBO(255, 255, 255, 0.4),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
