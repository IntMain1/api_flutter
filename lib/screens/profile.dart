import 'dart:io';

import '../constants/cashed_data.dart';
import '../constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

File? imgFile;
String? imgPath;

class ProfileView extends StatefulWidget {
  // final bool fromNew;
  const ProfileView({super.key,});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    getImage();
  }

  String? username;
  bool isVisible = true;
  bool fromNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  FutureBuilder(
                    future: CachedData().getImage(),
                    builder: (context, snapshot) => CircleAvatar(
                      radius: 52,
                      backgroundColor: AppStyle.white_t,
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: (snapshot.data != null)
                              ? FileImage(
                                  File(snapshot.data.toString()),
                                ) as ImageProvider
                              : const AssetImage(
                                  'lib/assets/images/avatar.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await getImageFromGallery();
                      },
                      child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.indigo,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1.5,
                  color: AppStyle.lime_t,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: (isVisible)
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: FutureBuilder(
                            future: CachedData().getName(),
                            builder: (c, snapshot) {
                              return Stack(
                                children: [
                                  Container(
                                      height: 60,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppStyle.container_b),
                                      child: Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                            color: AppStyle.white_t,
                                            fontSize: 20),
                                      )),
                                  Positioned(
                                    left: 10,
                                    bottom: 17,
                                    child: Icon(
                                      Icons.person,
                                      color: AppStyle.lime_t,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      )
                    : TextFormField(
                        style: TextStyle(color: AppStyle.white_t),
                        cursorColor: AppStyle.lime_t,
                        onFieldSubmitted: (value) {
                          setState(() {
                            if (value == "") {
                              username = CachedData.NAME;
                              isVisible = true;
                            } else {
                              setName(value);
                              username = value;
                              isVisible = true;
                            }
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppStyle.lime_t,
                            ),
                            filled: true,
                            fillColor: AppStyle.container_b,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppStyle.container_b)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppStyle.container_b)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppStyle.container_b))),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(pickedFile.path.toString());
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setImage(pickedFile.path.toString());
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }

  Future<void> setImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('IMAGE', path);
    getImage();
  }

  getImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString('IMAGE');
    });
  }

  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('NAME', name);
    getImage();
  }

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString('NAME');
    });
  }
}
