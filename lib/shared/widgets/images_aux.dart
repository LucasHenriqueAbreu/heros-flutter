import 'package:flutter/material.dart';

class ImageAux extends StatelessWidget {
  final String url;

  const ImageAux({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white54),
      child: ClipRRect(
        child: getImageNetwork(url),
      ),
    );
  }

  Widget getImageNetwork(String url) {
    try {
      if (url.isNotEmpty) {
        return FadeInImage.assetNetwork(
          placeholder: 'assets/images/place_holder.jpg',
          image: url,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset('assets/images/place_holder.jpg');
      }
    } catch (e) {
      return Image.asset('assets/images/place_holder.jpg');
    }
  }
}
