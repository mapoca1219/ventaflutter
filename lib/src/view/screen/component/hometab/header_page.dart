import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  List<String> listImage =  [ 
    'https://krika.vteximg.com.br/arquivos/ids/177487',
    'https://krika.vteximg.com.br/arquivos/ids/177488',
    'https://krika.vteximg.com.br/arquivos/ids/181543',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 300,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: listImage.map((e) => Image.network(e,fit: BoxFit.cover,)).toList(),
    );
  }
}
