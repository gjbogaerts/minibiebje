import 'package:flutter/material.dart';
import '../theming/paddings.dart';
import '../theming/custom_colors.dart';
import '../../core/utils/my_validator.dart';
import '../../core/viewmodels/auth_screen_model.dart';
// import '../widgets/my_dialog.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isRegistering;
  String _errorString;
  bool _hidePassword = true;
  TextEditingController _pwController = TextEditingController();
  Map<String, dynamic> _formValues = {
    'username': null,
    'email': null,
    'password': null
  };
  bool _authResult;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyValidator validator = MyValidator();
  final AuthScreenModel authScreenModel = AuthScreenModel();

  @override
  void initState() {
    super.initState();
    _isRegistering = false;
    _errorString = '';
  }

  void _startAuth() async {
    if (!_formKey.currentState.validate()) {
      setState(() {
        _errorString =
            'Je formulier bevat fouten. Wil je het svp correct invullen?';
      });
      return;
    } else {
      setState(() {
        _errorString = '';
      });
    }
    _formKey.currentState.save();
    _formValues['register'] = _isRegistering;
    try {
      final result = await authScreenModel.auth(_formValues);
      setState(() {
        _authResult = result;
        _errorString = '';
      });
    } catch (err) {
      setState(() {
        _errorString = err.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistering ? 'Registratie' : 'Login'),
      ),
      body: SingleChildScrollView(
        child: _authResult != null && _authResult == true
            ? AlertDialog(
                title: Text('Ingelogd!'),
                content: Text('Je bent nu ingelogd.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'OK',
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(Paddings.screenPadding),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Paddings.containerPadding),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              if (_errorString.isNotEmpty)
                                Text(
                                  _errorString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: CustomColors.red,
                                      ),
                                ),
                              TextFormField(
                                validator: (value) {
                                  return validator.checkStringLength(
                                      value: value, min: 5, max: 25);
                                },
                                onSaved: (newValue) {
                                  _formValues['username'] = newValue;
                                },
                                decoration: InputDecoration(
                                    labelText: _isRegistering
                                        ? 'Kies een gebruikersnaam'
                                        : 'Gebruikersnaam'),
                              ),
                              SizedBox(
                                height: Paddings.dividerHeight,
                              ),
                              if (_isRegistering)
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Email adres'),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    return validator.isValidEmail(value);
                                  },
                                  onSaved: (newValue) {
                                    _formValues['email'] = newValue;
                                  },
                                ),
                              if (_isRegistering)
                                SizedBox(
                                  height: Paddings.dividerHeight,
                                ),
                              TextFormField(
                                controller: _pwController,
                                decoration: InputDecoration(
                                  labelText: 'Wachtwoord',
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() =>
                                            _hidePassword = !_hidePassword);
                                      }),
                                ),
                                obscureText: _hidePassword,
                                validator: (value) =>
                                    validator.isValidPassword(value),
                                onSaved: (newValue) {
                                  _formValues['password'] = newValue;
                                },
                              ),
                              _isRegistering
                                  ? SizedBox(
                                      height: Paddings.dividerHeight,
                                    )
                                  : SizedBox.shrink(),
                              _isRegistering
                                  ? TextFormField(
                                      obscureText: _hidePassword,
                                      decoration: InputDecoration(
                                          labelText: 'Herhaal je wachtwoord',
                                          suffixIcon: IconButton(
                                              icon: Icon(Icons.visibility),
                                              onPressed: () {
                                                setState(() => _hidePassword =
                                                    !_hidePassword);
                                              })),
                                      validator: (value) {
                                        if (value != _pwController.text) {
                                          return 'De wachtwoorden zijn niet hetzelfde.';
                                        }
                                        return null;
                                      },
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: Paddings.dividerHeight,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () => setState(
                                        () => _isRegistering = !_isRegistering),
                                    child: Text(_isRegistering
                                        ? 'Ik kan inloggen'
                                        : 'Ik moet me registreren'),
                                  ),
                                  ElevatedButton(
                                    onPressed: _startAuth,
                                    child: Text(_isRegistering
                                        ? 'Registeren'
                                        : 'Inloggen'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
