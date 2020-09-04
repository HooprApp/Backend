import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class XDRaymondProfilePic extends StatelessWidget {
  XDRaymondProfilePic({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 200.0, 200.0),
          size: Size(200.0, 200.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child:
              // Adobe XD layer: 'raymond' (shape)
              Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x99ff8336),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
