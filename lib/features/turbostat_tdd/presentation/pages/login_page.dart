import 'package:flutter/material.dart';
import 'package:turbostat_app/core/auth/auth_provider.dart';
import 'package:turbostat_app/core/auth/base_auth.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'dart:async';

import 'package:turbostat_app/generated/i18n.dart';

class EmailFieldValidator {
  BuildContext context;

  EmailFieldValidator(this.context);

  String? validate(String value) {
    return value.isEmpty ? AppLocalizations.of(context)!.enter_email : null;
  }
}

class PasswordFieldValidator {
  BuildContext context;

  PasswordFieldValidator(this.context);

  String validate(String value) {
    return value.isEmpty ? AppLocalizations.of(context)!.enter_password : '';
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({required this.onSignedIn, required this.onSignedOut});

  final VoidCallback onSignedIn;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  late String _email;
  late String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth? auth = AuthProvider.of(context)!.auth;
        if (_formType == FormType.login) {
          final String userId =
              await auth!.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          final String userId =
              await auth!.createUserWithEmailAndPassword(_email, _password);
          print('Registered user: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error with email: $e');
        _showSnackBar(e);
      }
    }
  }

  void _showSnackBar(e) {
    key.currentState!.showSnackBar(SnackBar(
      content: Text(e.toString()),
      backgroundColor: Colors.red,
    ));
  }

  Future<void> googleSignIn() async {
    try {
      final BaseAuth? auth = AuthProvider.of(context)!.auth;
      final String userId = await auth!.signInWithGoogle();
      print('Signed with Google as $userId');
      widget.onSignedIn();
    } catch (e) {
      print('Error with Google: $e');
      _showSnackBar(e);
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState!.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: MainAppBar(),
        body: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: buildInputs() + buildSubmitButtons(),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  List<Widget> buildInputs() {
    return <Widget>[
      Text(
        AppLocalizations.of(context)!.login,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Divider(),
      TextFormField(
        key: Key('email'),
        decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(Icons.email),
        ),
        // validator: EmailFieldValidator(context).validate,
        onSaved: (String? value) => _email = value ?? '',
      ),
      TextFormField(
        key: Key('password'),
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          icon: Icon(Icons.lock),
        ),
        obscureText: true,
        // validator: PasswordFieldValidator(context).validate,
        onSaved: (String? value) => _password = value ?? '',
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        Container(
          height: 30.0,
        ),
        ElevatedButton(
          key: Key('signIn'),
          child: Text(AppLocalizations.of(context)!.signin, style: TextStyle()),
          onPressed: validateAndSubmit,
          // color: Colors.yellow,
          // highlightColor: Colors.orange[400],
        ),
        Container(
          height: 20.0,
        ),
        ElevatedButton(
          key: Key('googleSignIn'),
          child: Wrap(
            children: <Widget>[
              Image.asset(
                'res/images/google_logo.png',
                height: 15.0,
              ),
              Container(
                width: 10.0,
              ),
              Text(AppLocalizations.of(context)!.signin_with_google)
            ],
          ),
          onPressed: googleSignIn,
          // color: Colors.yellow,
        ),
        Container(
          height: 20.0,
        ),
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.registration,
          ),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: Text(
                AppLocalizations.of(context)!.registration.toUpperCase(),
                style: TextStyle()),
            onPressed: validateAndSubmit,
            // color: Colors.yellow,
            // highlightColor: Colors.orange[400],
          ),
        ),
        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.already_have_account,
              style: TextStyle(fontSize: 14.0, color: Colors.green)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
// TODO возвращать ошибку авторизации если пользователь не найден
