import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

String userNameValidator(value) {
  if (value == 'error') {
    return 'Username already exists';
  }
  return null;
}

class EditScreenBody extends StatefulWidget {
  @override
  _EditScreenBodyState createState() => _EditScreenBodyState();
  final _formKey = GlobalKey<FormState>();
  void submit(context) {
    // _formKey.currentState.validate();
    Navigator.of(context).pop();
  }
}

class _EditScreenBodyState extends State<EditScreenBody> {
  final picker = ImagePicker();
  File _image;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: new Text(
                      'Camera',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    PickedFile image = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      _image = File(image.path);
    });
  }

  _imgFromGallery() async {
    PickedFile image = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ProfileAvatar(
                AssetImage('test.png'),
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Change Profile Picture',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _showPicker(context),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  buildTextField(
                    context,
                    'Username',
                    validator: userNameValidator,
                  ),
                  buildTextField(
                    context,
                    'Full name',
                  ),
                  buildTextField(
                    context,
                    'Biography',
                    multiline: true,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                    ),
                  ),
                  buildTextField(
                    context,
                    'Email',
                  ),
                  buildTextField(
                    context,
                    'Phone number',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextField(
    BuildContext context,
    String label, {
    multiline = false,
    Function validator,
  }) {
    return TextFormField(
      validator: validator,
      keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
      maxLines: multiline ? 10 : 1,
      minLines: 1,
      style: TextStyle(
        fontSize: 14,
        color: Theme.of(context).primaryColor,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor.withAlpha(200),
          fontSize: 15,
        ),
      ),
    );
  }
}
