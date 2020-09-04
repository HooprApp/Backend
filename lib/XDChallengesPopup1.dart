import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDChallengesPopup1 extends StatelessWidget {
  XDChallengesPopup1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenges Popup 1')),
      body: Stack(
        children: <Widget>[
          Container(
            width: 375.0,
            height: 812.0,
            decoration: BoxDecoration(
              color: const Color(0x80000000),
            ),
          ),
          Transform.translate(
            offset: Offset(27.0, 280.0),
            child: Container(
              width: 322.0,
              height: 372.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xfff4f4f9),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(303.7, 300.2),
            child: SvgPicture.string(
              _svg_53xti2,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(59.0, 350.0),
            child: Text(
              'WINNER CONFIRM?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 29,
                color: const Color(0xff0b1012),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(64.0, 429.0),
            child: Container(
              width: 247.0,
              height: 37.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(64.0, 503.0),
            child: Container(
              width: 247.0,
              height: 63.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffff8336),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(138.0, 521.0),
            child: Text(
              'CONFIRM',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 23,
                color: const Color(0xff361c0d),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(130.0, 437.0),
            child: Text(
              'Raymond Tran',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(157.0, 586.0),
            child: Text(
              'Dispute',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: const Color(0xffff8336),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_53xti2 =
    '<svg viewBox="303.7 300.2 17.7 17.7" ><path transform="translate(1234.66, 1223.16)" d="M -922.161376953125 -914.1613159179688 L -930.9996337890625 -905.3226318359375 L -922.161376953125 -914.1613159179688 L -930.9996337890625 -922.99951171875 L -922.161376953125 -914.1613159179688 L -913.3226928710938 -923.0004272460938 L -922.161376953125 -914.1613159179688 L -913.3226928710938 -905.3226318359375 L -922.161376953125 -914.1613159179688 Z" fill="none" stroke="#707070" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
