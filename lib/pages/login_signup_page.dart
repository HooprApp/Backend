// import 'package:flutter/material.dart';
// import 'package:hoopr/services/authentication.dart';

// class LoginSignupPage extends StatefulWidget {
//   LoginSignupPage({this.auth, this.loginCallback});

//   final BaseAuth auth;
//   final VoidCallback loginCallback;

//   @override
//   State<StatefulWidget> createState() => _LoginSignupPageState();
// }

// enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

// class _LoginSignupPageState extends State<LoginSignupPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _email;
//   String _password;
//   String _errorMessage;

//   FormMode _formMode = FormMode.LOGIN;
//   bool _isLoading;

//   // Check if form is valid before perform login or signup
//   bool validateAndSave() {
//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }

//   // Perform login or signup
//   void validateAndSubmit() async {
//     setState(() {
//       _errorMessage = "";
//       _isLoading = true;
//     });
//     if (validateAndSave()) {
//       String userId = "";
//       try {
//         if (_formMode == FormMode.LOGIN) {
//           userId = await widget.auth.signIn(_email, _password);
//           if (userId == null) {
//             setState(() {
//               _isLoading = false;
//               _errorMessage =
//                   'Account not verified. Please verify account using the link sent to your email account and then try again.';
//               _formKey.currentState.reset();
//             });
//             return;
//           }
//         } else if (_formMode == FormMode.SIGNUP) {
//           userId = await widget.auth.signUp(_email, _password);
//           widget.auth.sendEmailVerification();
//           _showVerifyEmailSentDialog();
//         } else {
//           widget.auth.sendPasswordReset(_email);
//           _showPasswordEmailSentDialog();
//         }
//         setState(() {
//           _isLoading = false;
//         });

//         if (userId.length > 0 &&
//             userId != null &&
//             _formMode == FormMode.LOGIN) {
//           widget.loginCallback();
//         }
//       } catch (e) {
//         print('Error: $e');
//         setState(() {
//           _isLoading = false;
//           _errorMessage = e.message;
//           _formKey.currentState.reset();
//         });
//       }
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     _errorMessage = "";
//     _isLoading = false;
//     super.initState();
//   }

//   void resetForm() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Hoopr'),
//         ),
//         body: Stack(
//           children: <Widget>[
//             _showForm(),
//             _showCircularProgress(),
//           ],
//         ));
//   }

//   void _changeFormToSignUp() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//     setState(() {
//       _formMode = FormMode.SIGNUP;
//     });
//   }

//   void _changeFormToLogin() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//     setState(() {
//       _formMode = FormMode.LOGIN;
//     });
//   }

//   void _changeFormToPasswordReset() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//     setState(() {
//       _formMode = FormMode.FORGOTPASSWORD;
//     });
//   }

//   Widget _showCircularProgress() {
//     if (_isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Container(
//       height: 0.0,
//       width: 0.0,
//     );
//   }

//   void _showVerifyEmailSentDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: Text("Verify your account"),
//           content: Text("Link to verify account has been sent to your email"),
//           actions: <Widget>[
//             FlatButton(
//               child: Text("Dismiss"),
//               onPressed: () {
//                 _changeFormToLogin();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showPasswordEmailSentDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text("Forgot your password"),
//           content: new Text("An email has been sent to reset your password"),
//           actions: <Widget>[
//             new FlatButton(
//               child: new Text("Dismiss"),
//               onPressed: () {
//                 _changeFormToLogin();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _showForm() {
//     return Container(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               _showEmailInput(),
//               _showPasswordInput(),
//               _showPrimaryButton(),
//               _showSecondaryButton(),
//               _showForgotPasswordButton(),
//               _showErrorMessage(),
//             ],
//           ),
//         ));
//   }

//   Widget _showErrorMessage() {
//     if (_errorMessage != null && _errorMessage.length > 0) {
//       return Text(
//         _errorMessage,
//         style: TextStyle(
//             fontSize: 13.0,
//             color: Colors.red,
//             height: 1.0,
//             fontWeight: FontWeight.w300),
//       );
//     } else {
//       return Container(
//         height: 0.0,
//       );
//     }
//   }

//   Widget _showEmailInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
//       child: TextFormField(
//         maxLines: 1,
//         keyboardType: TextInputType.emailAddress,
//         autofocus: false,
//         decoration: InputDecoration(
//             hintText: 'Email',
//             icon: Icon(
//               Icons.mail,
//               color: Colors.grey,
//             )),
//         validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
//         onSaved: (value) => _email = value.trim(),
//       ),
//     );
//   }

//   Widget _showPasswordInput() {
//     if (_formMode != FormMode.FORGOTPASSWORD) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
//         child: TextFormField(
//           maxLines: 1,
//           obscureText: true,
//           autofocus: false,
//           decoration: InputDecoration(
//               hintText: 'Password',
//               icon: Icon(
//                 Icons.lock,
//                 color: Colors.grey,
//               )),
//           validator: (value) =>
//               value.isEmpty ? 'Password can\'t be empty' : null,
//           onSaved: (value) => _password = value.trim(),
//         ),
//       );
//     } else {
//       return Text('An email will be sent allowing you to reset your password',
//           style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300));
//     }
//   }

//   Widget _showPrimaryButton() {
//     return Padding(
//         padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
//         child: SizedBox(
//           height: 40.0,
//           child: RaisedButton(
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0)),
//               color: Colors.blue,
//               child: _textPrimaryButton(),
//               onPressed: validateAndSubmit),
//         ));
//   }

//   Widget _showSecondaryButton() {
//     return FlatButton(
//       child: _textSecondaryButton(),
//       onPressed: _formMode == FormMode.LOGIN
//           ? _changeFormToSignUp
//           : _changeFormToLogin,
//     );
//   }

//   Widget _showForgotPasswordButton() {
//     return FlatButton(
//       child: _formMode == FormMode.LOGIN
//           ? Text('Forgot password?',
//               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300))
//           : Text('',
//               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
//       onPressed: _changeFormToPasswordReset,
//     );
//   }

//   Widget _textPrimaryButton() {
//     switch (_formMode) {
//       case FormMode.LOGIN:
//         return Text('Login',
//             style: TextStyle(fontSize: 20.0, color: Colors.white));
//         break;
//       case FormMode.SIGNUP:
//         return Text('Create account',
//             style: TextStyle(fontSize: 20.0, color: Colors.white));
//         break;
//       case FormMode.FORGOTPASSWORD:
//         return Text('Reset password',
//             style: TextStyle(fontSize: 20.0, color: Colors.white));
//         break;
//     }
//     return Spacer();
//   }

//   Widget _textSecondaryButton() {
//     switch (_formMode) {
//       case FormMode.LOGIN:
//         return Text('Create an account',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
//         break;
//       case FormMode.SIGNUP:
//         return Text('Have an account? Sign in',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
//         break;
//       case FormMode.FORGOTPASSWORD:
//         return Text('Cancel',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
//         break;
//     }
//     return Spacer();
//   }
// }
