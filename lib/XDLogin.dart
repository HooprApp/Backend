import 'package:flutter/material.dart';
import 'package:hoopr/services/authentication.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDLogin extends StatefulWidget {
  XDLogin({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => _XDLogin();
}

enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

class _XDLogin extends State<XDLogin> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  FormMode _formMode = FormMode.LOGIN;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
          if (userId == null) {
            setState(() {
              _isLoading = false;
              _errorMessage =
                  'Account not verified. Please verify account using the link sent to your email account and then try again.';
              _formKey.currentState.reset();
            });
            return;
          }
        } else if (_formMode == FormMode.SIGNUP) {
          print("hello");
          userId = await widget.auth.signUp(_email, _password);
          print(userId);
          widget.auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
        } else {
          widget.auth.sendPasswordReset(_email);
          _showPasswordEmailSentDialog();
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 &&
            userId != null &&
            _formMode == FormMode.LOGIN) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff001331),
        appBar: AppBar(
          title: Text('Hoopr'),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ));
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _changeFormToPasswordReset() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.FORGOTPASSWORD;
    });
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Verify your account"),
          content: Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            FlatButton(
              child: Text("Dismiss"),
              onPressed: () {
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPasswordEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Forgot your password"),
          content: new Text("An email has been sent to reset your password"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// Todo: Add widgets for name, date of birth, etc.
  Widget _showForm() {
    if (_formMode == FormMode.LOGIN) {
      return Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showForgotPasswordButton(),
                _showErrorMessage(),
              ],
            ),
          ));
    } else if (_formMode == FormMode.LOGIN) {
      return Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showForgotPasswordButton(),
                _showErrorMessage(),
              ],
            ),
          ));
    } else {
      return Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showForgotPasswordButton(),
                _showErrorMessage(),
              ],
            ),
          ));
    }
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return Container(
        height: 0.0,
      );
    }
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    if (_formMode != FormMode.FORGOTPASSWORD) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Open Sans',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 24)),
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value.trim(),
        ),
      );
    } else {
      return Text('An email will be sent allowing you to reset your password',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300));
    }
  }

  Widget _showPrimaryButton() {
    return Align(
        alignment: Alignment.centerRight,
        child: ClipOval(
            child: Container(
                color: Colors.orange,
                height: 60.0, // height of the button
                width: 60.0, // width of the button
                child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.orange,
                    child: _textPrimaryButton(),
                    onPressed: validateAndSubmit))));
  }

  Widget _showSecondaryButton() {
    return FlatButton(
      child: _textSecondaryButton(),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin,
    );
  }

  Widget _showForgotPasswordButton() {
    return FlatButton(
      child: _formMode == FormMode.LOGIN
          ? Text('Forgot password?',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300))
          : Text('',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
      onPressed: _changeFormToPasswordReset,
    );
  }

  Widget _textPrimaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return Text('Login',
            style: TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.SIGNUP:
        return Text('Create account',
            style: TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.FORGOTPASSWORD:
        return Text('Reset password',
            style: TextStyle(fontSize: 20.0, color: Colors.white));
        break;
    }
    return Spacer();
  }

  Widget _textSecondaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return Text('Create an account',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.SIGNUP:
        return Text('Have an account? Sign in',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.FORGOTPASSWORD:
        return Text('Cancel',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
    }
    return Spacer();
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff001331),
//       body: Stack(
//         children: <Widget>[
//           Transform.translate(
//             offset: Offset(24.0, 105.0),
//             child: Text(
//               'Log in',
//               style: TextStyle(
//                 fontFamily: 'Open Sans',
//                 fontSize: 24,
//                 color: const Color(0xffffffff),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(22.0, 180.0),
//             child: TextFormField(
//               cursorColor: Color(0XFFFFCC00),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 labelStyle: TextStyle(
//                   fontFamily: 'Open Sans',
//                   fontSize: 22,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(22.0, 272.0),
//             child: TextFormField(
//               cursorColor: Color(0XFFFFCC00),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 labelStyle: TextStyle(
//                   fontFamily: 'Open Sans',
//                   fontSize: 22,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(22.3, 37.0),
//             child: Transform.rotate(
//               angle: 3.1416,
//               child:
//                   // Adobe XD layer: 'arrow' (group)
//                   BlendMask(
//                 blendMode: BlendMode.srcOver,
//                 region: Offset(22.3, 37.0) & Size(35.4, 18.0),
//                 child: SizedBox(
//                   width: 35.0,
//                   height: 18.0,
//                   child: Stack(
//                     children: <Widget>[
//                       Pinned.fromSize(
//                         bounds: Rect.fromLTWH(0.0, 7.8, 34.5, 2.4),
//                         size: Size(35.4, 18.0),
//                         pinLeft: true,
//                         pinRight: true,
//                         fixedHeight: true,
//                         child: SvgPicture.string(
//                           _svg_9773mp,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Pinned.fromSize(
//                         bounds: Rect.fromLTWH(20.9, 0.0, 14.5, 18.0),
//                         size: Size(35.4, 18.0),
//                         pinRight: true,
//                         pinTop: true,
//                         pinBottom: true,
//                         fixedWidth: true,
//                         child: SvgPicture.string(
//                           _svg_7v4sci,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(22.5, 229.5),
//             child: SvgPicture.string(
//               _svg_4z914q,
//               allowDrawingOutsideViewBox: true,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(22.5, 322.5),
//             child: SvgPicture.string(
//               _svg_lvq8nl,
//               allowDrawingOutsideViewBox: true,
//             ),
//           ),
//           Align(
//               alignment: Alignment.centerRight,
//               child: FlatButton(
//                   onPressed: () {
//                     print('hello');
//                   },
//                   child: ClipOval(
//                       child: Container(
//                     color: Colors.orange,
//                     height: 60.0,
//                     width: 60.0,
//                     child: Icon(Icons.arrow_forward),
//                   )))),
//         ],
//       ),
//     );
//   }

const String _svg_9773mp =
    '<svg viewBox="0.0 7.6 34.5 2.4" ><path transform="translate(-13.55, -232.38)" d="M 47.2796745300293 242.4311828613281 L 14.29705238342285 242.4311828613281 C 13.88998985290527 242.4311828613281 13.56000137329102 241.8914184570312 13.56000137329102 241.2255859375 C 13.56000137329102 240.5597686767578 13.88998985290527 240.0200042724609 14.29705238342285 240.0200042724609 L 47.2796745300293 240.0200042724609 C 47.68674468994141 240.0200042724609 48.01673126220703 240.5597686767578 48.01673126220703 241.2255859375 C 48.01673126220703 241.8914184570312 47.68674468994141 242.4311828613281 47.2796745300293 242.4311828613281 Z" fill="#adadad" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7v4sci =
    '<svg viewBox="20.9 -0.2 14.5 18.0" ><path transform="translate(-345.48, -175.93)" d="M 366.5380249023438 193.341796875 C 366.2738647460938 192.9251861572266 366.3977355957031 192.3733215332031 366.8145446777344 192.1095275878906 L 378.3367919921875 184.7801666259766 L 366.8145446777344 177.4398803710938 C 366.5333862304688 177.2742919921875 366.3649597167969 176.968505859375 366.3753051757812 176.6423645019531 C 366.3856811523438 176.3162231445312 366.5731201171875 176.0217132568359 366.8642272949219 175.8742980957031 C 367.1553344726562 175.7268829345703 367.5036926269531 175.7500457763672 367.772705078125 175.9347076416016 L 380.47021484375 184.0221252441406 C 380.727783203125 184.1859741210938 380.8837890625 184.4700622558594 380.8837890625 184.7752990722656 C 380.8837890625 185.08056640625 380.727783203125 185.3646545410156 380.47021484375 185.5285034179688 L 367.772705078125 193.6159057617188 C 367.3559875488281 193.8807220458984 366.8035278320312 193.7580871582031 366.5380249023438 193.341796875 Z" fill="#adadad" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4z914q =
    '<svg viewBox="22.5 229.5 331.0 83.7" ><path transform="translate(22.5, 229.5)" d="M 0 0 L 331 0" fill="none" stroke="#ff8336" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(261.4, 170.79)" d="M 84.97925567626953 119.5245513916016 C 84.01861572265625 118.9698944091797 82.79055786132812 119.2990112304688 82.23616027832031 120.2595062255859 L 81.03779602050781 122.3296661376953 C 80.20614624023438 122.1507720947266 79.32672119140625 122.0504913330078 78.39946746826172 122.0504913330078 C 69.753662109375 122.0504913330078 65.29046630859375 130.8190460205078 65.29046630859375 130.8190460205078 C 65.29046630859375 130.8190460205078 67.71826934814453 135.2144317626953 72.09278869628906 137.7810974121094 L 71.17254638671875 139.3705902099609 C 70.61805725097656 140.3310241699219 70.94702911376953 141.5590972900391 71.90760803222656 142.1137390136719 C 72.86794281005859 142.6681213378906 74.09621429443359 142.3392639160156 74.6507568359375 141.3786773681641 L 85.71418762207031 122.2676391601562 C 86.26880645751953 121.3072052001953 85.93959808349609 120.0790405273438 84.97925567626953 119.5245513916016 Z M 72.34048461914062 130.8190460205078 C 72.34048461914062 127.4343719482422 75.06745147705078 124.6898345947266 78.44334411621094 124.6898345947266 C 78.84144592285156 124.6898345947266 79.23043060302734 124.7281341552734 79.60700225830078 124.801025390625 L 78.51324462890625 126.6903533935547 C 78.48995208740234 126.6900024414062 78.46675109863281 126.6890716552734 78.44334411621094 126.6890716552734 C 76.17227172851562 126.6890716552734 74.33090209960938 128.5391998291016 74.33090209960938 130.8190002441406 C 74.33090209960938 131.5879669189453 74.54090118408203 132.3066253662109 74.90583801269531 132.9218139648438 L 73.81243896484375 134.8105010986328 C 72.89495086669922 133.7382354736328 72.34048461914062 132.3441619873047 72.34048461914062 130.8190460205078 Z M 86.06876373291016 124.5920104980469 L 83.96712493896484 128.2102355957031 C 84.33811187744141 129.0018920898438 84.54624938964844 129.8858795166016 84.54624938964844 130.8190460205078 C 84.54624938964844 134.0487518310547 82.06273651123047 136.6935577392578 78.90231323242188 136.9292602539062 L 77.38716125488281 139.5377197265625 C 77.73838806152344 139.5699157714844 78.09603118896484 139.5876617431641 78.46083068847656 139.5876617431641 C 87.07164764404297 139.5876617431641 91.5963134765625 130.8190002441406 91.5963134765625 130.8190002441406 C 91.5963134765625 130.8190002441406 89.72223663330078 127.181396484375 86.06876373291016 124.5920104980469 Z" fill="#adadad" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gtsg41 =
    '<svg viewBox="0.0 6.5 29.4 2.1" ><path transform="translate(-13.55, -233.52)" d="M 42.32868194580078 242.0771331787109 L 14.18883419036865 242.0771331787109 C 13.84153938293457 242.0771331787109 13.56000232696533 241.6166381835938 13.56000232696533 241.0485687255859 C 13.56000232696533 240.4805145263672 13.84153938293457 240.0199890136719 14.18883419036865 240.0199890136719 L 42.32868194580078 240.0199890136719 C 42.67598342895508 240.0199890136719 42.95751571655273 240.4805145263672 42.95751571655273 241.0485687255859 C 42.95751571655273 241.6166381835938 42.67598342895508 242.0771331787109 42.32868194580078 242.0771331787109 Z" fill="#001331" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4lddtd =
    '<svg viewBox="17.8 -0.2 12.4 15.3" ><path transform="translate(-348.54, -175.93)" d="M 366.5140686035156 190.762939453125 C 366.2886962890625 190.4075012207031 366.3943786621094 189.9366607666016 366.75 189.7115936279297 L 376.5804443359375 183.4584045410156 L 366.75 177.1958618164062 C 366.5101013183594 177.0546112060547 366.3663940429688 176.7937164306641 366.375244140625 176.5154724121094 C 366.3840942382812 176.2371978759766 366.5440063476562 175.9859466552734 366.7923583984375 175.8601531982422 C 367.0407409667969 175.7343902587891 367.3379516601562 175.754150390625 367.5674743652344 175.9116973876953 L 378.400634765625 182.8116455078125 C 378.620361328125 182.9514465332031 378.7534790039062 183.1938323974609 378.7534790039062 183.4542388916016 C 378.7534790039062 183.7146911621094 378.620361328125 183.9570617675781 378.400634765625 184.0968627929688 L 367.5674743652344 190.9968109130859 C 367.2119445800781 191.2227325439453 366.7405700683594 191.1181030273438 366.5140686035156 190.762939453125 Z" fill="#001331" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lvq8nl =
    '<svg viewBox="22.5 322.5 331.0 1.0" ><path transform="translate(22.5, 322.5)" d="M 0 0 L 331 0" fill="none" stroke="#ff8336" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
