import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({this.imageUrl, this.radius});

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imageUrl),
    );
  }
}
