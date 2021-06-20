import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _phoneno;
  String _password;
  String _url;
  String _dob;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildname() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter Your name";
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildemail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Type Email";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return "Enter a valid email";
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
    ;
  }

  Widget _buildphoneno() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone no.'),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter Phone no.";
        }
      },
      onSaved: (String value) {
        _email = value;
      },
    );
    ;
  }

  Widget _buildpassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter password";
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
    ;
  }

  Widget _buildurl() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter url name";
        }
      },
      onSaved: (String value) {
        _url = value;
      },
    );
    ;
  }

  Widget _builddob() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Date of Birth'),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter Date of Birth";
        }
      },
      onSaved: (String value) {
        _dob = value;
      },
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Data")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildname(),
              _buildemail(),
              _buildphoneno(),
              _buildpassword(),
              _buildurl(),
              _builddob(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_name);
                    print(_email);
                    print(_url);
                    print(_password);
                    print(_dob);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
