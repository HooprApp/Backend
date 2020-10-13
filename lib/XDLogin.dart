import 'package:flutter/material.dart';
import 'package:hoopr/services/authentication.dart';

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
  String _firstname;
  String _lastname;
  String _username;

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
          userId = await widget.auth
              .signUp(_email, _password, _firstname, _lastname, _username);

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
          backgroundColor: const Color(0xff001331),
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
                _showtitle(),
                _showemailtitle(),
                _showEmailInput(),
                _showpasswordtitle(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showForgotPasswordButton(),
                _showErrorMessage(),
              ],
            ),
          ));
    } else if (_formMode == FormMode.SIGNUP) {
      return Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showtitle(),
                _showemailtitle(),
                _showEmailInput(),
                _showfirstnametitle(),
                _showfirstnameinput(),
                _showlastnametitle(),
                _showlastnameinput(),
                _showusernametitle(),
                _showusernameinput(),
                _showpasswordtitle(),
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
                _showtitle(),
                _showemailtitle(),
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

  Widget _showemailtitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        'Email',
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
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

  Widget _showfirstnametitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        'First Name',
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    );
  }

  Widget _showfirstnameinput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'First name',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        validator: (value) =>
            value.isEmpty ? 'First name can\'t be empty' : null,
        onSaved: (value) => _firstname = value.trim(),
      ),
    );
  }

  Widget _showlastnametitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        'Last Name',
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    );
  }

  Widget _showlastnameinput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Last name',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        validator: (value) =>
            value.isEmpty ? 'Last name can\'t be empty' : null,
        onSaved: (value) => _lastname = value.trim(),
      ),
    );
  }

  Widget _showusernametitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        'Username',
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    );
  }

  Widget _showusernameinput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Username can\'t be empty' : null,
        onSaved: (value) => _username = value.trim(),
      ),
    );
  }

  Widget _showpasswordtitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        'Password',
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    );
  }

  Widget _showPasswordInput() {
    if (_formMode != FormMode.FORGOTPASSWORD) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
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
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Colors.white));
    }
  }

  Widget _showtitle() {
    if (_formMode == FormMode.LOGIN) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, .0, 0.0, 40.0),
        child: Text(
          'Log in',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (_formMode == FormMode.SIGNUP) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
        child: Text(
          'Sign up',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
        child: Text(
          'Forgot password',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }
    ;
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
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white))
          : Text('',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
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
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.white));
        break;
      case FormMode.SIGNUP:
        return Text('Have an account? Sign in',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.white));
        break;
      case FormMode.FORGOTPASSWORD:
        return Text('Cancel',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.white));
        break;
    }
    return Spacer();
  }
}
