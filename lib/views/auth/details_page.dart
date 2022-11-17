import 'dart:io';

import 'package:care_tracker/shared/shared_widgets.dart';
import 'package:care_tracker/theme/theme.dart';
import 'package:care_tracker/views/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_tracker/views/auth/login_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String name = '';
  String phone = '';
  File? _image;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomBackButton(),
                SizedBox(height: 15.w),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text(
                        'create an account',
                        style: TextStyle(
                          height: 1.25.w,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: CustomTheme.t1,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.w),
                    _buildProfile(Theme.of(context).colorScheme, context),
                    SizedBox(height: 35.w),
                    TextFormField(
                      decoration: customInputDecoration(labelText: 'name'),
                      style: formTextStyle(),
                      onSaved: (value) {
                        name = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your name';
                        }
                      },
                    ),
                    SizedBox(height: 20.w),
                    TextFormField(
                      decoration:
                          customInputDecoration(labelText: 'phone number'),
                      style: formTextStyle(),
                      onSaved: (value) {
                        phone = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your phone number';
                        }
                      },
                    ),
                    SizedBox(height: 30.w),
                    CustomElevatedButton(
                      text: 'next',
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(
                              name: name,
                              phone: phone,
                              image: _image,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: CustomTheme.t2,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "login!",
                        style: TextStyle(
                          fontSize: 15,
                          color: CustomTheme.t1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(ColorScheme colors, BuildContext context) {
    return Center(
      child: SizedBox(
        height: 116.w,
        width: 116.w,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colors.primary, width: 3.6.w),
                borderRadius: BorderRadius.circular(58.w),
              ),
              padding: EdgeInsets.all(3.w),
              child: InkWell(
                borderRadius: BorderRadius.circular(58.w),
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.25),
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return _buildBottomCard(colors);
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55.w),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _image != null
                          ? SizedBox(
                              height: 110.w,
                              width: 110.w,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              height: 110.w,
                              width: 110.w,
                              child: Image.network(
                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                      _image != null
                          ? const SizedBox.shrink()
                          : Container(
                              height: 40.w,
                              color: Colors.black45,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 25.w,
                                color: colors.surface,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            _image != null
                ? Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 44.w,
                      width: 44.w,
                      decoration: BoxDecoration(
                        color: colors.surface,
                        border: Border.all(color: colors.primary, width: 2.5.w),
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 24.w,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            barrierColor: Colors.black.withOpacity(0.25),
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return _buildBottomCard(colors);
                            },
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  // choose image from camera
  Future<File?> _imageFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? image = File(pickedFile.path);
      return image;
    } else {
      return null;
    }
  }

  // choose image from gallery
  Future<File?> _imageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? image = File(pickedFile.path);
      return image;
    } else {
      return null;
    }
  }

  Widget _buildBottomCard(ColorScheme colors) {
    return Card(
      margin: EdgeInsets.all(15.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.camera_alt_outlined, color: colors.onSurface),
              title: Text(
                'Camera',
                style: TextStyle(fontSize: 17, color: colors.onSurface),
              ),
              onTap: () async {
                File? image = await _imageFromCamera();
                if (image != null) {
                  setState(() {
                    _image = image;
                  });
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            Divider(
              indent: 10.w,
              endIndent: 10.w,
              height: 8.w,
              thickness: 1.5.w,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.add_photo_alternate_outlined,
                  color: colors.onSurface),
              title: Text(
                'Gallery',
                style: TextStyle(fontSize: 17, color: colors.onSurface),
              ),
              onTap: () async {
                File? image = await _imageFromGallery();
                if (image != null) {
                  setState(() {
                    _image = image;
                  });
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
