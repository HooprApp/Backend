import 'package:flutter/material.dart';
import './XDUserProfile1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import './XDChallenges1.dart';
import './XDLeaderboard.dart';
import './XDRaymondProfilePic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'drawer.dart';

class XDUserProfile2 extends StatelessWidget {
  XDUserProfile2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile 2')),
      drawer: MyDrawer(),
      backgroundColor: const Color(0xff001331),
      body: Stack(
        children: <Widget>[
          SvgPicture.string(
            _svg_qq2taw,
            allowDrawingOutsideViewBox: true,
          ),
          Transform.translate(
            offset: Offset(105.0, 238.0),
            child: Text(
              'Raymond Tran',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 26,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(-13.1, 427.5),
            child: SvgPicture.string(
              _svg_qwz5qs,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(45.0, 332.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDUserProfile1(),
                ),
              ],
              child: Text(
                'Badges',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 26,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(247.0, 332.0),
            child: Text(
              'History',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 26,
                color: const Color(0xffff8336),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(161.0, 275.0),
            child: Text(
              '@Ran',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 23.0),
            child: SvgPicture.string(
              _svg_9jnve6,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(38.2, 778.0),
            child:
                // Adobe XD layer: 'Messages/Challenges…' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDChallenges1(),
                ),
              ],
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 24.1, 24.1),
                      size: Size(24.1, 24.1),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_ud36q7,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 11.7, 24.1, 1.0),
                      size: Size(24.1, 24.1),
                      pinLeft: true,
                      pinRight: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_ra7xtg,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(6.6, 0.0, 4.3, 24.0),
                      size: Size(24.1, 24.1),
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child: SvgPicture.string(
                        _svg_dfue39,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(1.8, 16.0, 17.8, 6.1),
                      size: Size(24.1, 24.1),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_udojr1,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(1.8, 2.0, 17.7, 6.1),
                      size: Size(24.1, 24.1),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_nx4pzg,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(16.7, 20.1, 1.0, 1.0),
                      size: Size(24.1, 24.1),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_jiommn,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(16.7, 20.0, 1.0, 1.0),
                      size: Size(24.1, 24.1),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xqtt15,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(16.7, 20.0, 1.0, 1.0),
                      size: Size(24.1, 24.1),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xqtt15,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(168.6, 770.8),
            child:
                // Adobe XD layer: 'Leaderboard Icon' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDLeaderboard(),
                ),
              ],
              child: SizedBox(
                width: 39.0,
                height: 34.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(21.4, 4.3, 13.6, 19.2),
                      size: Size(38.6, 34.2),
                      pinRight: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_64ghr,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(22.5, 16.3, 1.3, 1.3),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_cs7rem,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(19.1, 17.6, 7.5, 7.6),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_jgwoju,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(23.6, 4.3, 15.0, 16.2),
                      size: Size(38.6, 34.2),
                      pinRight: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_acdvnv,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(14.0, 17.1, 4.5, 6.3),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_vxa32g,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(19.1, 13.6, 1.9, 2.7),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_dmn6hb,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(21.6, 4.3, 6.0, 8.4),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_dgnxbo,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(11.6, 17.1, 10.2, 8.1),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_4pwvsd,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(14.7, 16.3, 1.3, 1.2),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_bvr6cu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(15.7, 11.0, 7.1, 5.8),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_kje4bv,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(19.9, 4.3, 11.3, 10.9),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_m5ntnn,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(21.4, 17.4, 2.7, 3.8),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_g8lrl1,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(12.1, 4.3, 8.5, 12.1),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_q0gvnu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.9, 0.0, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_9mh8mu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(8.6, 4.3, 15.3, 13.2),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_1k1wsj,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(17.7, 17.1, 8.0, 5.7),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_nji3hl,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(13.8, 18.8, 2.9, 4.1),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_j6vnve,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.5, 0.0, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xo62w8,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(3.6, 4.3, 9.9, 14.0),
                      size: Size(38.6, 34.2),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_s8hkjt,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.5, 0.0, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_zi12bu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 4.3, 16.0, 16.2),
                      size: Size(38.6, 34.2),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_28a9rv,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(11.9, 17.6, 7.1, 7.0),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_s6z6a1,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(20.0, 17.1, 4.0, 5.7),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_3i1zoy,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.9, 0.0, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_dni4h6,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(11.0, 4.3, 8.5, 12.0),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_6uquvb,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.9, 0.0, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_9mh8mu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.4, 4.3, 16.4, 13.2),
                      size: Size(38.6, 34.2),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_5blpdx,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(16.7, 17.1, 9.7, 7.4),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_oi5k3q,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(10.7, 17.1, 17.1, 17.1),
                      size: Size(38.6, 34.2),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_41z4zn,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(10.7, 17.1, 17.1, 17.1),
                      size: Size(38.6, 34.2),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_41z4zn,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(25.2, 18.2, 2.5, 3.6),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_7iq2mu,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(25.3, 17.9, 1.0, 1.0),
                      size: Size(38.6, 34.2),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xybbw4,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(33.2, 536.0),
            child: SizedBox(
              width: 310.0,
              child: Text(
                'There are currently no \ngames to show',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 26,
                  color: const Color(0xffff8336),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(88.0, 23.0),
            child:
                // Adobe XD layer: 'Raymond Profile Pic' (component)
                SizedBox(
              width: 200.0,
              height: 200.0,
              child: XDRaymondProfilePic(),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_qq2taw =
    '<svg viewBox="0.0 0.0 375.0 387.0" ><path  d="M 0 0 L 375 0 L 375 368 C 375 378.493408203125 366.493408203125 387 356 387 L 19 387 C 8.506588935852051 387 0 378.493408203125 0 368 L 0 0 Z" fill="#ffffff" fill-opacity="0.29" stroke="none" stroke-width="1" stroke-opacity="0.29" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff000000"  /><stop offset="1.0" stop-color="#ff001331"  /></linearGradient></defs><path  d="M 0 0 L 375 0 L 375 368 C 375 378.493408203125 366.493408203125 387 356 387 L 19 387 C 8.506588935852051 387 0 378.493408203125 0 368 L 0 0 Z" fill="url(#gradient)" fill-opacity="0.78" stroke="#ffffff" stroke-width="1" stroke-opacity="0.78" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qwz5qs =
    '<svg viewBox="-13.1 427.5 1.0 1.0" ><path transform="translate(-931.0, 19.0)" d="M 917.9345703125 408.5484619140625" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ud36q7 =
    '<svg viewBox="0.0 0.0 24.1 24.1" ><path transform="translate(-5.66, -6.49)" d="M 29.80850601196289 18.56335830688477 C 29.80850601196289 18.69598388671875 29.80850601196289 18.82761192321777 29.80207633972168 18.9592399597168 C 29.68873977661133 22.50490760803223 28.01937675476074 25.82064437866211 25.23859786987305 28.02334213256836 C 24.96676445007324 28.23909759521484 24.68552398681641 28.44330215454102 24.3948860168457 28.63596153259277 C 22.42046165466309 29.94502258300781 20.10321807861328 30.64140319824219 17.73425102233887 30.63761901855469 C 17.16699600219727 30.63761901855469 16.60266494750977 30.59832763671875 16.04311370849609 30.5200309753418 C 15.73194217681885 30.4767894744873 15.42298984527588 30.42120361328125 15.11849117279053 30.35358238220215 C 12.21089267730713 29.70753479003906 9.644453048706055 28.01009178161621 7.912046432495117 25.58721542358398 C 7.756994247436523 25.37080574035645 7.608536720275879 25.1492748260498 7.466686248779297 24.92263221740723 C 6.352306842803955 23.12788391113281 5.731313228607178 21.07082176208496 5.66643238067627 18.9592399597168 C 5.661979198455811 18.82761192321777 5.659999370574951 18.69598388671875 5.659999370574951 18.56335830688477 C 5.659999370574951 18.43074417114258 5.659999370574951 18.29911613464355 5.66643238067627 18.16748809814453 C 5.732021331787109 16.04937744140625 6.357249736785889 13.98639869689941 7.478559494018555 12.18825244903564 C 7.507755279541016 12.13876914978027 7.537447929382324 12.09373378753662 7.567634582519531 12.04672431945801 C 7.681447982788086 11.86956882476807 7.799880027770996 11.69554901123047 7.922933578491211 11.52466106414795 C 7.956086158752441 11.47765064239502 7.990230560302734 11.43113422393799 8.024871826171875 11.38462162017822 C 9.869938850402832 8.88773250579834 12.60608768463135 7.197726249694824 15.66480922698975 6.66576099395752 C 15.98249912261963 6.610671043395996 16.30430793762207 6.568442344665527 16.6302490234375 6.539081573486328 C 16.99313735961914 6.506092071533203 17.36113929748535 6.489596366882324 17.73425102233887 6.489596366882324 C 20.09785270690918 6.485176086425781 22.41024971008301 7.178001403808594 24.38202285766602 8.481354713439941 C 24.58787727355957 8.616940498352051 24.78894424438477 8.758630752563477 24.98523902893066 8.906427383422852 C 25.06688499450684 8.967788696289062 25.14804077148438 9.03014087677002 25.22820854187012 9.094470024108887 C 25.38210105895996 9.215211868286133 25.53253555297852 9.34189510345459 25.68000030517578 9.470057487487793 C 28.20368194580078 11.67005825042725 29.69785499572754 14.82118225097656 29.80405426025391 18.16748809814453 C 29.8065242767334 18.29911613464355 29.80850601196289 18.43074417114258 29.80850601196289 18.56335830688477 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ra7xtg =
    '<svg viewBox="0.0 11.7 24.1 1.0" ><path transform="translate(-5.66, -230.8)" d="M 29.80850601196289 242.8758850097656 C 29.80850601196289 243.0083923339844 29.80850601196289 243.1400756835938 29.80207633972168 243.2716064453125 L 5.66643238067627 243.2716064453125 C 5.661979198455811 243.1400756835938 5.659999370574951 243.0083923339844 5.659999370574951 242.8758850097656 C 5.659999370574951 242.7431335449219 5.659999370574951 242.6115417480469 5.66643238067627 242.4799194335938 L 29.80207633972168 242.4799194335938 C 29.8065242767334 242.6115417480469 29.80850601196289 242.7431335449219 29.80850601196289 242.8758850097656 Z" fill="#030e13" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dfue39 =
    '<svg viewBox="6.6 0.0 4.3 24.0" ><path transform="translate(-133.06, -7.44)" d="M 142.9762573242188 30.32766914367676 C 143.1326446533203 30.72354316711426 143.2881774902344 31.10408592224121 143.4429321289062 31.46927833557129 C 143.1294708251953 31.42573356628418 142.8205871582031 31.37014579772949 142.5160980224609 31.30251502990723 C 142.4236602783203 31.08148384094238 142.3316345214844 30.85418510437012 142.2399139404297 30.62061882019043 C 141.5471649169922 28.86342239379883 140.7706909179688 26.6163158416748 140.2605438232422 24.2727165222168 C 140.2034759521484 24.01242828369141 140.1502532958984 23.75115013122559 140.1006774902344 23.48888397216797 C 139.8685150146484 22.30897521972656 139.7328338623047 21.11210632324219 139.6949615478516 19.91016006469727 C 139.6914672851562 19.77753639221191 139.6900024414062 19.64590835571289 139.6900024414062 19.5142765045166 C 139.6900024414062 19.38264846801758 139.6900024414062 19.25498199462891 139.6949615478516 19.1184024810791 C 139.7319793701172 17.91428756713867 139.8779602050781 16.71600151062012 140.1308746337891 15.53818035125732 C 140.1837158203125 15.28449535369873 140.2429046630859 15.02354335784912 140.3085327148438 14.75533580780029 C 140.6959838867188 13.1648998260498 141.306640625 11.33149147033691 142.2498474121094 9.278867721557617 C 142.5264129638672 8.677131652832031 142.8020324707031 8.12043285369873 143.0637969970703 7.616678714752197 C 143.3815307617188 7.561583995819092 143.7033843994141 7.519357204437256 144.0293273925781 7.489999294281006 C 143.6923370361328 8.109053611755371 143.3261260986328 8.82905387878418 142.9614715576172 9.623778343200684 C 142.3250274658203 11.00934505462646 141.6198883056641 12.79079627990723 141.1250152587891 14.74593448638916 C 141.0570678710938 15.00985622406006 140.9938812255859 15.27756404876709 140.9355316162109 15.54907321929932 C 140.6738891601562 16.72208786010742 140.5233001708984 17.91713905334473 140.4857025146484 19.11839866638184 C 140.4817504882812 19.25002670288086 140.4802551269531 19.38215255737305 140.4802551269531 19.5142765045166 C 140.4802551269531 19.64640045166016 140.4802551269531 19.7725830078125 140.4857025146484 19.91015434265137 C 140.5094604492188 20.8389778137207 140.6208343505859 22.0261173248291 140.9048461914062 23.48492240905762 C 140.9559631347656 23.74719429016113 141.0128326416016 24.01869964599609 141.0755615234375 24.2994384765625 C 141.4526062011719 25.98341369628906 142.0503845214844 27.98803329467773 142.9762573242188 30.32766914367676 Z" fill="#030e13" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_udojr1 =
    '<svg viewBox="1.8 16.0 17.8 6.1" ><path transform="translate(-40.39, -314.45)" d="M 59.97042846679688 335.9811401367188 C 59.69860076904297 336.1968688964844 59.4173583984375 336.4011535644531 59.12673187255859 336.5936889648438 C 58.37010955810547 336.3991088867188 57.62935638427734 336.1475830078125 56.91079711914062 335.8410339355469 C 54.5355224609375 334.8131713867188 52.942626953125 333.7592468261719 51.66245269775391 332.9120788574219 C 50.36894226074219 332.056396484375 49.45592498779297 331.4521789550781 48.40982818603516 331.3062438964844 C 48.24589538574219 331.2831115722656 48.08054351806641 331.2716674804688 47.91497039794922 331.2716674804688 C 47.80809020996094 331.2716674804688 47.70137023925781 331.2743225097656 47.59480285644531 331.2796020507812 C 46.09442901611328 331.3544006347656 44.61979675292969 331.9559631347656 43.20799255371094 333.0710144042969 C 43.019287109375 333.2200317382812 42.83174133300781 333.3780517578125 42.64534759521484 333.5448303222656 C 42.49030303955078 333.3285217285156 42.34185791015625 333.1069946289062 42.20000457763672 332.8802490234375 C 42.36856842041016 332.7316589355469 42.53830718994141 332.5896911621094 42.70919799804688 332.4547729492188 C 44.21897888183594 331.2617492675781 45.80545043945312 330.6046142578125 47.43548583984375 330.4957275390625 C 47.59514617919922 330.4851989746094 47.75515747070312 330.47998046875 47.91546630859375 330.47998046875 C 48.02565765380859 330.47998046875 48.13419342041016 330.4837646484375 48.24107360839844 330.49169921875 C 49.59003448486328 330.5906982421875 50.66039276123047 331.2983703613281 52.10089111328125 332.2519836425781 C 53.35482025146484 333.081787109375 54.91558074951172 334.1145629882812 57.22698974609375 335.1145935058594 C 58.07466125488281 335.4813232421875 59.00548553466797 335.7644653320312 59.97042846679688 335.9811401367188 Z" fill="#030e13" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nx4pzg =
    '<svg viewBox="1.8 2.0 17.7 6.1" ><path transform="translate(-40.59, -44.75)" d="M 60.15767288208008 47.35305023193359 C 59.1946907043457 47.56782531738281 58.26337814331055 47.84791946411133 57.41719436645508 48.21408462524414 C 55.10477828979492 49.21121215820312 53.54254913330078 50.24295806884766 52.28762817382812 51.07035827636719 C 50.84513092041016 52.02193450927734 49.77378845214844 52.72856903076172 48.42485046386719 52.82507705688477 C 48.31796646118164 52.83300018310547 48.20941543579102 52.83695602416992 48.09923934936523 52.83695602416992 C 47.93890380859375 52.83695602416992 47.77890777587891 52.83135986328125 47.61923217773438 52.82014083862305 C 45.99119567871094 52.71028518676758 44.40570449829102 52.05014801025391 42.89792251586914 50.85508728027344 C 42.73294830322266 50.72479248046875 42.57031631469727 50.58868789672852 42.40998077392578 50.44685745239258 C 42.43917465209961 50.39736557006836 42.46887588500977 50.35231781005859 42.49905776977539 50.30531311035156 C 42.61286926269531 50.12818145751953 42.7313232421875 49.95413589477539 42.85436248779297 49.78326416015625 C 43.03349685668945 49.94358062744141 43.21394348144531 50.09566879272461 43.39571762084961 50.23949432373047 C 44.80604553222656 51.35637283325195 46.27968597412109 51.96006774902344 47.78006744384766 52.03679275512695 C 47.88646697998047 52.04223251342773 47.99333953857422 52.04471588134766 48.10023880004883 52.04520034790039 C 48.26575469970703 52.04513549804688 48.43111419677734 52.03372192382812 48.59506988525391 52.01105499267578 C 49.64118957519531 51.86655426025391 50.55514907836914 51.26335144042969 51.84967803955078 50.40972518920898 C 53.13134002685547 49.56404113769531 54.72523880004883 48.51200485229492 57.10198593139648 47.4871711730957 C 57.81928634643555 47.18276214599609 58.55852890014648 46.93299865722656 59.31345748901367 46.73995590209961 C 59.51931381225586 46.87552261352539 59.72038650512695 47.0172233581543 59.91667556762695 47.16501998901367 C 59.99633407592773 47.22637176513672 60.07749557495117 47.28873443603516 60.15767288208008 47.35305023193359 Z" fill="#030e13" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jiommn =
    '<svg viewBox="16.7 20.1 1.0 1.0" ><path transform="translate(-325.93, -391.68)" d="M 342.6000061035156 411.7300109863281" fill="none" stroke="#3d332a" stroke-width="16" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_xqtt15 =
    '<svg viewBox="16.7 20.0 1.0 1.0" ><path transform="translate(-325.98, -391.44)" d="M 342.6600036621094 411.4800109863281" fill="none" stroke="#3d332a" stroke-width="16" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_9jnve6 =
    '<svg viewBox="0.0 23.0 375.7 789.0" ><path transform="translate(1258.0, 4.0)" d="M -909 23.00040054321289 C -909 20.79090118408203 -907.2090454101562 18.99990081787109 -905.0004272460938 18.99990081787109 C -902.7908935546875 18.99990081787109 -900.9999389648438 20.79090118408203 -900.9999389648438 23.00040054321289 C -900.9999389648438 25.2090015411377 -902.7908935546875 27 -905.0004272460938 27 C -907.2090454101562 27 -909 25.2090015411377 -909 23.00040054321289 Z M -919.9998168945312 23.00040054321289 C -919.9998168945312 20.79090118408203 -918.2088012695312 18.99990081787109 -916.000244140625 18.99990081787109 C -913.7907104492188 18.99990081787109 -911.9996948242188 20.79090118408203 -911.9996948242188 23.00040054321289 C -911.9996948242188 25.2090015411377 -913.7907104492188 27 -916.000244140625 27 C -918.2088012695312 27 -919.9998168945312 25.2090015411377 -919.9998168945312 23.00040054321289 Z M -930.9996337890625 23.00040054321289 C -930.9996337890625 20.79090118408203 -929.2095336914062 18.99990081787109 -927 18.99990081787109 C -924.79052734375 18.99990081787109 -923.0004272460938 20.79090118408203 -923.0004272460938 23.00040054321289 C -923.0004272460938 25.2090015411377 -924.79052734375 27 -927 27 C -929.2095336914062 27 -930.9996337890625 25.2090015411377 -930.9996337890625 23.00040054321289 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="-0.042471" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#00030e13" stop-opacity="0.0" /><stop offset="0.719543" stop-color="#6d040b0e" stop-opacity="0.43" /><stop offset="0.949794" stop-color="#f2060707" stop-opacity="0.95" /><stop offset="1.0" stop-color="#ff0a1417"  /></linearGradient></defs><path transform="translate(-931.0, 348.0)" d="M 931 464.0000305175781 L 931 355 L 1306.731323242188 355 L 1306.731323242188 464.0000305175781 L 931 464.0000305175781 Z" fill="url(#gradient)" stroke="none" stroke-width="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-931.0, 409.67)" d="M 931 402.3251953125 L 931 355 L 1306.731323242188 355 L 1306.731323242188 402.3251953125 L 931 402.3251953125 Z" fill="#001331" stroke="#ffffff" stroke-width="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(313.7, 776.44)" d="M 0.05490000173449516 23.30190086364746 C 1.032299995422363 17.74259948730469 5.942699909210205 13.51440048217773 11.85300064086914 13.51440048217773 C 17.56890106201172 13.51440048217773 22.34970092773438 17.4689998626709 23.54129981994629 22.75920104980469 C 20.4507007598877 25.81560134887695 16.20090103149414 27.7047004699707 11.51100063323975 27.7047004699707 C 7.104599952697754 27.7047004699707 3.087000131607056 26.03790092468262 0.05490000173449516 23.30190086364746 Z M 6.720300197601318 5.06790018081665 C 6.720300197601318 2.268900156021118 9.018000602722168 0 11.85300064086914 0 C 14.68710041046143 0 16.98480033874512 2.268900156021118 16.98480033874512 5.06790018081665 C 16.98480033874512 7.866899967193604 14.68710041046143 10.1358003616333 11.85300064086914 10.1358003616333 C 9.018000602722168 10.1358003616333 6.720300197601318 7.866899967193604 6.720300197601318 5.06790018081665 Z" fill="#ff8336" stroke="#ff8336" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_64ghr =
    '<svg viewBox="21.4 4.3 13.6 19.2" ><path transform="translate(-251.33, -50.43)" d="M 272.7598876953125 73.91685485839844 L 273.4419860839844 72.95578765869141 L 274.3016662597656 71.74324798583984 L 274.8910522460938 70.91419982910156 L 275.941650390625 69.43289947509766 L 276.0870971679688 69.22858428955078 L 276.4021911621094 68.78537750244141 L 276.4100036621094 68.77438354492188 L 276.5435791015625 68.58578491210938 L 276.6756591796875 68.39875030517578 L 276.6772766113281 68.39640045166016 L 286.3767700195312 54.73000717163086" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cs7rem =
    '<svg viewBox="22.5 16.3 1.3 1.3" ><path transform="translate(-268.94, -203.84)" d="M 292.8024291992188 221.3718566894531 C 292.3792114257812 221.1271820068359 291.9369506835938 220.9169616699219 291.47998046875 220.7431335449219 L 291.92236328125 220.1199951171875 L 292.8024291992188 221.3718566894531 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jgwoju =
    '<svg viewBox="19.1 17.6 7.5 7.6" ><path transform="translate(-228.16, -219.1)" d="M 254.7324829101562 240.369384765625 L 251.9624481201172 244.2734527587891 L 250.4512939453125 243.2007446289062 L 249.5908203125 242.5901794433594 L 248.6234588623047 241.9033203125 L 248.6234588623047 241.9033203125 L 247.219970703125 240.9076843261719 L 247.5712127685547 240.4126281738281 L 248.1598205566406 239.5828094482422 L 249.3558349609375 237.8971862792969 L 249.9451904296875 237.068115234375 L 250.22021484375 236.679931640625 C 251.1472778320312 237.0047302246094 252.0110778808594 237.4875183105469 252.7733764648438 238.1069946289062 C 253.0726623535156 238.3490905761719 253.3546447753906 238.6116638183594 253.6174163818359 238.8927917480469 C 253.6897125244141 238.9713745117188 253.7588806152344 239.0452575683594 253.8263854980469 239.1230163574219 C 254.1656799316406 239.5101470947266 254.4689178466797 239.9273376464844 254.7324829101562 240.3694152832031 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_acdvnv =
    '<svg viewBox="23.6 4.3 15.0 16.2" ><path transform="translate(-276.39, -50.43)" d="M 315.0054321289062 54.73000717163086 L 303.5181884765625 70.915771484375 L 301.7398681640625 68.39640045166016 L 301.73828125 68.39875030517578 L 301.6746215820312 68.30915832519531 L 299.9599609375 65.87937164306641 L 299.9599609375 65.87859344482422 L 307.8724365234375 54.73000717163086 L 315.0054321289062 54.73000717163086 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vxa32g =
    '<svg viewBox="14.0 17.1 4.5 6.3" ><path transform="translate(-164.37, -200.82)" d="M 178.3899536132812 224.2970581054688 L 179.9301910400391 222.1266174316406 L 181.71484375 219.6119079589844 L 181.8617401123047 219.4052734375 L 182.4495544433594 218.575439453125 L 182.8943176269531 217.9499206542969" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dmn6hb =
    '<svg viewBox="19.1 13.6 1.9 2.7" ><path transform="translate(-224.09, -158.91)" d="M 243.1999359130859 175.2056579589844 L 243.3633880615234 174.9754333496094 L 243.9512023925781 174.1455841064453 L 245.1480407714844 172.4599609375" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dgnxbo =
    '<svg viewBox="21.6 4.3 6.0 8.4" ><path transform="translate(21.65, 4.3)" d="M 5.977033615112305 0 L 0 8.422539710998535" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4pwvsd =
    '<svg viewBox="11.6 17.1 10.2 8.1" ><path transform="translate(-141.17, -213.47)" d="M 163.001220703125 230.9700317382812 L 162.8142395019531 231.2325134277344 L 162.2248077392578 232.0623168945312 L 161.0311279296875 233.7471466064453 L 160.4425659179688 234.5762329101562 L 157.5648498535156 238.6302795410156 L 156.0560607910156 237.5615539550781 L 155.1916351318359 236.9470520019531 L 154.21484375 236.2539215087891 L 152.8200073242188 235.2638244628906 L 153.1688995361328 234.7718505859375 L 154.3869476318359 233.0564117431641 L 154.3869476318359 233.0564117431641 C 154.6056060791016 232.8378601074219 154.8364868164062 232.6319122314453 155.0784759521484 232.4395141601562 C 155.8453826904297 231.8250122070312 156.7129211425781 231.3479919433594 157.6426391601562 231.0297546386719 C 157.7212219238281 231.0030212402344 157.7998199462891 230.9771118164062 157.8783874511719 230.9511566162109 C 158.2085113525391 230.8487091064453 158.5447540283203 230.7668151855469 158.8850250244141 230.7059631347656 C 159.1511840820312 230.6577911376953 159.4214935302734 230.6224365234375 159.6960144042969 230.5998992919922 C 159.9317932128906 230.5804901123047 160.1698760986328 230.570556640625 160.4103393554688 230.570068359375 C 160.6759643554688 230.570068359375 160.9399871826172 230.5826416015625 161.2001342773438 230.6069641113281 L 161.2001342773438 230.6069641113281 C 161.6509399414062 230.6471862792969 162.0977172851562 230.7241973876953 162.5360412597656 230.8372344970703 C 162.6947937011719 230.8765258789062 162.8487548828125 230.9181823730469 163.001220703125 230.9700317382812 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bvr6cu =
    '<svg viewBox="14.7 16.3 1.3 1.2" ><path transform="translate(-177.2, -203.73)" d="M 192.7671356201172 220 L 193.1954040527344 220.6066589355469 C 192.7561950683594 220.7697296142578 192.3298645019531 220.9657287597656 191.9200439453125 221.1929016113281 L 192.7671356201172 220 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kje4bv =
    '<svg viewBox="15.7 11.0 7.1 5.8" ><path transform="translate(-188.86, -142.37)" d="M 211.6958312988281 158.4386901855469 L 211.1669921875 159.1836547851562 C 210.2434234619141 158.8617553710938 209.2749481201172 158.6872711181641 208.297119140625 158.6666107177734 L 208.0920104980469 158.6666107177734 L 207.97021484375 158.6666107177734 C 206.9884948730469 158.677978515625 206.0147705078125 158.8450622558594 205.08544921875 159.1616821289062 L 204.5699462890625 158.4308471679688 L 205.1592712402344 157.6025848388672 L 206.3553161621094 155.9169464111328 L 206.9439392089844 155.0863647460938 L 208.1399536132812 153.3999633789062 L 209.9175109863281 155.9193115234375 L 211.6958312988281 158.4386901855469 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m5ntnn =
    '<svg viewBox="19.9 4.3 11.3 10.9" ><path transform="translate(-232.99, -50.43)" d="M 264.1814575195312 54.73000717163086 L 256.4158630371094 65.67269897460938 L 254.6375122070312 63.15254211425781 L 252.8599700927734 60.63317108154297 L 257.0484313964844 54.73000717163086 L 264.1814575195312 54.73000717163086 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g8lrl1 =
    '<svg viewBox="21.4 17.4 2.7 3.8" ><path transform="translate(-250.5, -203.61)" d="M 274.5419921875 224.7710571289062 L 274.0618896484375 224.0904998779297 L 272.2843627929688 221.5703430175781 L 272.1381225585938 221.3636474609375 L 271.8599853515625 220.9699554443359" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_q0gvnu =
    '<svg viewBox="12.1 4.3 8.5 12.1" ><path transform="translate(-142.4, -50.43)" d="M 154.5499725341797 54.73000717163086 L 160.4900512695312 63.14704132080078 L 162.2676086425781 65.66719818115234 L 163.0958557128906 66.84044647216797" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9mh8mu =
    '<svg viewBox="7.9 0.0 1.0 1.0" ><path transform="translate(-93.05, -0.08)" d="M 100.9978485107422 0.09392917156219482 L 100.9899826049805 0.09392917156219482 L 100.9947052001953 0.09000003337860107 L 100.9978485107422 0.09392917156219482 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1k1wsj =
    '<svg viewBox="8.6 4.3 15.3 13.2" ><path transform="translate(-105.3, -63.43)" d="M 129.1680603027344 80.95709228515625 C 128.7447509765625 80.71246337890625 128.3025054931641 80.50222778320312 127.8455200195312 80.32841491699219 C 127.7669372558594 80.29856872558594 127.6883544921875 80.27027893066406 127.6097717285156 80.24356079101562 C 126.6870803833008 79.92277526855469 125.7197189331055 79.74908447265625 124.7430419921875 79.72882080078125 L 124.5379638671875 79.72882080078125 L 124.4161376953125 79.72882080078125 C 123.7756042480469 79.73692321777344 123.1376190185547 79.81063842773438 122.512092590332 79.9488525390625 L 121.6052398681641 78.66481781005859 L 113.8899383544922 67.72998046875 L 119.8347625732422 67.72998046875 L 124.5858917236328 74.46218872070312 L 126.3634338378906 76.9815673828125 L 128.142578125 79.50094604492188 L 128.2887268066406 79.70840454101562 L 129.1680603027344 80.95709228515625 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nji3hl =
    '<svg viewBox="17.7 17.1 8.0 5.7" ><path transform="translate(-212.29, -213.47)" d="M 237.9588775634766 233.4917602539062 L 237.92822265625 233.5137634277344 L 236.3353729248047 234.6382446289062 L 235.5495300292969 235.1883544921875 L 234.4037933349609 235.9962005615234 L 233.9566192626953 236.310546875 L 232.2899169921875 233.9483184814453 L 232.1461029052734 233.7471466064453 L 230.3677673339844 231.2269592285156 L 230 230.7059631347656 C 230.26611328125 230.6577911376953 230.5364379882812 230.6224365234375 230.8109741210938 230.5998992919922 C 231.0467224121094 230.5804901123047 231.2847900390625 230.570556640625 231.5252990722656 230.570068359375 C 231.7908935546875 230.570068359375 232.054931640625 230.5826416015625 232.3150787353516 230.6069641113281 L 232.3150787353516 230.6069641113281 C 232.765869140625 230.6471862792969 233.2126312255859 230.7241973876953 233.6509399414062 230.8372344970703 C 233.8080749511719 230.8765258789062 233.9613494873047 230.9212799072266 234.1138000488281 230.9700317382812 C 234.1923828125 230.9944000244141 234.2709655761719 231.0218811035156 234.3495788574219 231.0486145019531 C 235.2765960693359 231.3734130859375 236.1403961181641 231.8562164306641 236.9027099609375 232.4756774902344 C 237.2019348144531 232.7177734375 237.4839172363281 232.9803161621094 237.7467041015625 233.2615203857422 C 237.8221435546875 233.3369445800781 237.8912963867188 233.4139251708984 237.9588775634766 233.4917602539062 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j6vnve =
    '<svg viewBox="13.8 18.8 2.9 4.1" ><path transform="translate(-161.58, -220.25)" d="M 175.3599853515625 239.0298767089844 L 175.4872741699219 239.2106628417969 L 177.1382751464844 241.550048828125 L 178.2251281738281 243.0910949707031" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xo62w8 =
    '<svg viewBox="0.5 0.0 1.0 1.0" ><path transform="translate(0.52, 0.0)" d="M 0.007858314551413059 0.01100163534283638 L 0 0" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s8hkjt =
    '<svg viewBox="3.6 4.3 9.9 14.0" ><path transform="translate(3.56, 4.3)" d="M 9.886547088623047 14.01058292388916 L 0 0" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zi12bu =
    '<svg viewBox="0.5 0.0 1.0 1.0" ><path transform="translate(-5.98, 0.0)" d="M 6.512786388397217 0.01100163534283638 L 6.489997863769531 0.01100163534283638 L 6.504928588867188 0 L 6.512786388397217 0.01100163534283638 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_28a9rv =
    '<svg viewBox="0.0 4.3 16.0 16.2" ><path transform="translate(-4.63, -63.43)" d="M 20.62323760986328 80.30563354492188 C 18.75549697875977 80.99927520751953 17.1584644317627 82.27193450927734 16.0654125213623 83.937744140625 L 4.629999160766602 67.72998046875 L 11.74884605407715 67.72998046875 L 20.1949577331543 79.69582366943359 L 20.62323760986328 80.30563354492188 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s6z6a1 =
    '<svg viewBox="11.9 17.6 7.1 7.0" ><path transform="translate(-144.54, -218.84)" d="M 163.5596923828125 240.0032653808594 L 161.1833648681641 241.6802062988281 L 159.4191284179688 242.9241485595703 L 158.8054046630859 243.357177734375 L 157.5787658691406 241.6165771484375 L 156.5328063964844 240.1313171386719 L 156.4699401855469 240.041748046875 L 156.4699401855469 240.041748046875 C 156.8293914794922 239.4500732421875 157.259521484375 238.9043884277344 157.7508544921875 238.4165954589844 L 157.7508544921875 238.4165954589844 L 157.7508544921875 238.4165954589844 C 157.9694976806641 238.1980743408203 158.2003936767578 237.9921417236328 158.4423828125 237.7997436523438 C 159.209228515625 237.1852111816406 160.0768280029297 236.7082366943359 161.0065612792969 236.3899993896484 L 161.8780670166016 237.6244812011719 L 163.5596923828125 240.0032653808594 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3i1zoy =
    '<svg viewBox="20.0 17.1 4.0 5.7" ><path transform="translate(-234.82, -200.91)" d="M 254.8499603271484 218.0399017333984 L 254.8507537841797 218.0399017333984 L 255.8754730224609 219.4937133789062 L 256.0216369628906 219.6995849609375 L 257.7991638183594 222.2197570800781 L 258.0852355957031 222.6244506835938 L 258.8852233886719 223.757568359375" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dni4h6 =
    '<svg viewBox="7.9 0.0 1.0 1.0" ><path transform="translate(7.94, 0.01)" d="M 0.003143325448036194 0.003929155878722668 L 0 0" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6uquvb =
    '<svg viewBox="11.0 4.3 8.5 12.0" ><path transform="translate(-128.64, -50.43)" d="M 139.6099243164062 54.73000717163086 L 146.1354522705078 63.9776611328125 L 147.9137878417969 66.49703979492188 L 148.0772399902344 66.72885131835938" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_5blpdx =
    '<svg viewBox="7.4 4.3 16.4 13.2" ><path transform="translate(-91.58, -63.43)" d="M 115.4482192993164 80.95709228515625 C 115.0248947143555 80.71246337890625 114.5826416015625 80.50222778320312 114.1256561279297 80.32841491699219 C 114.0470733642578 80.29856872558594 113.968505859375 80.27027893066406 113.8899078369141 80.24356079101562 C 112.9672164916992 79.92277526855469 111.9998474121094 79.74908447265625 111.023193359375 79.72882080078125 L 110.8181076049805 79.72882080078125 L 110.6962890625 79.72882080078125 C 109.7145843505859 79.74018859863281 108.7408599853516 79.90731048583984 107.8115234375 80.22389221191406 L 107.2960052490234 79.49308013916016 L 98.99998474121094 67.72998046875 L 106.1188125610352 67.72998046875 L 110.8660430908203 74.46218872070312 L 112.6435852050781 76.9815673828125 L 114.4227142333984 79.50094604492188 L 114.5688934326172 79.70840454101562 L 115.4482192993164 80.95709228515625 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oi5k3q =
    '<svg viewBox="16.7 17.1 9.7 7.4" ><path transform="translate(-200.57, -213.47)" d="M 227.0069274902344 234.6476745605469 L 224.63134765625 236.3246765136719 L 222.864013671875 237.5709991455078 L 222.2550048828125 238.0016479492188 L 221.0361938476562 236.2728271484375 L 221.0361938476562 236.2728271484375 L 219.9839782714844 234.7797241210938 L 219.8378295898438 234.5722961425781 L 218.0594482421875 232.0528564453125 L 217.2798919677734 230.9480590820312 C 217.6078186035156 230.8468933105469 217.9416198730469 230.7660827636719 218.2795104980469 230.7059631347656 C 218.5456237792969 230.6577911376953 218.8159332275391 230.6224365234375 219.0904846191406 230.5998992919922 C 219.3262329101562 230.5804901123047 219.5643157958984 230.570556640625 219.8047790527344 230.570068359375 C 220.0704345703125 230.570068359375 220.3344421386719 230.5826416015625 220.5945434570312 230.6069641113281 L 220.5945434570312 230.6069641113281 C 221.0453643798828 230.6471862792969 221.4921569824219 230.7241973876953 221.9304809570312 230.8372344970703 C 222.087646484375 230.8765258789062 222.2408294677734 230.9212799072266 222.393310546875 230.9700317382812 C 222.4719085693359 230.9944000244141 222.5505065917969 231.0218811035156 222.6290893554688 231.0486145019531 C 223.5560913085938 231.3734130859375 224.4198913574219 231.8562164306641 225.1822052001953 232.4756774902344 C 225.4814453125 232.7177734375 225.763427734375 232.9803161621094 226.0262451171875 233.2615203857422 L 226.20458984375 233.5137634277344 L 227.0069274902344 234.6476745605469 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_41z4zn =
    '<svg viewBox="10.7 17.1 17.1 17.1" ><path transform="translate(-130.01, -213.47)" d="M 157.7864990234375 239.1128234863281 C 157.7864990234375 242.728515625 155.5118865966797 245.951904296875 152.1063842773438 247.1633605957031 C 148.7021179199219 248.3748474121094 144.9026489257812 247.3126678466797 142.6195373535156 244.5104370117188 C 140.3363647460938 241.708251953125 140.0637512207031 237.7725372314453 141.9386138916016 234.6822814941406 L 141.9386138916016 234.6822814941406 C 142.2981414794922 234.0906372070312 142.7282409667969 233.5448913574219 143.2195434570312 233.0571594238281 L 143.2195434570312 233.0572052001953 L 143.2195434570312 233.0572052001953 C 143.4382171630859 232.8386535644531 143.6690673828125 232.6327056884766 143.9111022949219 232.4403076171875 C 144.6779479980469 231.8258361816406 145.5455169677734 231.3488464355469 146.4752502441406 231.030517578125 C 146.5538635253906 231.0038299560547 146.6324310302734 230.9778747558594 146.7109680175781 230.9519500732422 C 147.0409088134766 230.8492431640625 147.3768005371094 230.76708984375 147.7168884277344 230.7059631347656 C 147.9830017089844 230.6577911376953 148.2533111572266 230.6224365234375 148.5278472900391 230.5998992919922 C 148.7635955810547 230.5804901123047 149.001708984375 230.570556640625 149.2421569824219 230.570068359375 C 149.5077819824219 230.570068359375 149.7717895507812 230.5826416015625 150.0319366455078 230.6069641113281 L 150.0319366455078 230.6069641113281 C 150.4827575683594 230.6471862792969 150.9295349121094 230.7241973876953 151.3678588867188 230.8372344970703 C 151.5249938964844 230.8765258789062 151.6782531738281 230.9212799072266 151.8306732177734 230.9700317382812 C 151.9092712402344 230.9944000244141 151.9878845214844 231.0218811035156 152.0664672851562 231.0486145019531 C 152.9934387207031 231.3734130859375 153.8572692871094 231.8562164306641 154.6195831298828 232.4756774902344 C 154.9188079833984 232.7177734375 155.2007904052734 232.9803161621094 155.4636077880859 233.2615203857422 C 155.535888671875 233.3400726318359 155.6050415039062 233.4139251708984 155.672607421875 233.4917602539062 C 157.0344085693359 235.047607421875 157.7845458984375 237.045166015625 157.7833251953125 239.1128234863281 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7iq2mu =
    '<svg viewBox="25.2 18.2 2.5 3.6" ><path transform="translate(25.22, 18.16)" d="M 2.509945392608643 3.555099964141846 L 0 0" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xybbw4 =
    '<svg viewBox="25.3 17.9 1.0 1.0" ><path transform="translate(-296.49, -209.63)" d="M 321.8450317382812 227.5986633300781 L 321.8435668945312 227.60107421875 L 321.77978515625 227.511474609375 L 321.7821960449219 227.5098876953125 L 321.8450317382812 227.5986633300781 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
