import 'package:flutter/material.dart';
import 'package:heros/models/thumbnail_model.dart';
import 'package:heros/shared/bottom_gradient.dart';

class CastCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Thumbnail image;

  CastCard(this.title, this.image, {this.height: 140.0, this.width: 100.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('teste'), //goToActorDetails(context, actor),
      child: Container(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'Cast-Hero-${title}',
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/place_holder.jpg',
                image: image != null
                    ? image.path + '.' + image.extension
                    : 'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                fit: BoxFit.cover,
                height: height,
                width: width,
              ),
            ),
            BottomGradient.noOffset(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
