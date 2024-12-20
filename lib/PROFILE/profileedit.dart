import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
import 'package:haptic_fone/screens/HOME/bottomuser.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  List<CreateAccount> profiledata = [];
  Uint8List? _imageBytes;
  void fetcheditdata() {
    final box = Hive.box<CreateAccount>("Create_Account");
    profiledata = box.values.toList();
    if (profiledata.isNotEmpty) {
      yourname.text = profiledata[0].USername;
      Mobilenumber.text = profiledata[0].phonenumber;
      email.text = profiledata[0].Email;
      city.text = profiledata[0].city;
    }
  }

  void saveDetails() {
    if (profiledata.isNotEmpty) {
      profiledata[0].USername = yourname.text; // Update name
      profiledata[0].phonenumber = Mobilenumber.text; // Update mobile
      profiledata[0].Email = email.text; // Update email
      profiledata[0].city = city.text; // Update city
      profiledata[0].save(); // Save to Hive
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile details updated successfully")),
      );
    } else {}
  }

  // Future<void> pickimage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });

  //     // Update Hive database with new image path
  //     Hive.box<CreateAccount>("Create_Account");
  //     if (profiledata.isNotEmpty) {
  //       profiledata[0].createimg = pickedFile.path; // Update image path
  //       profiledata[0].save(); // Save to Hive
  //     } else {}
  //   } else {}
  // }
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
      });
    } else {
      print("No image selected");
    }
  }

  @override
  void initState() {
    super.initState();
    fetcheditdata();
  }

  // ignore: non_constant_identifier_names
  TextEditingController Mobilenumber = TextEditingController();
  TextEditingController yourname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Bottomuser(
                                selecteddindex: 2,
                              )));
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF77B60B),
                          border: Border.all()),
                      child: _imageBytes == null
                          ? CircleAvatar(
                              radius: 55,
                              backgroundImage: profiledata.isNotEmpty &&
                                      profiledata[0].createimg.isNotEmpty
                                  ? MemoryImage((profiledata[0]
                                      .createimg)) // Hive data ninn profile image
                                  : const AssetImage(
                                          ImgaeAssetClass.profileimage)
                                      as ImageProvider, // Default image
                            )
                          : CircleAvatar(
                              radius: 55,
                              backgroundImage: MemoryImage(_imageBytes!),
                            )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF77B60B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text("Change Image"),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Your Name"),
            ),
            TextFormField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              controller: yourname,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFF77B60B)))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Mobile Number"),
            ),
            TextFormField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              controller: Mobilenumber,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF77B60B)),
                      borderRadius: BorderRadius.circular(15))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Email"),
            ),
            TextFormField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              controller: email,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF77B60B)),
                      borderRadius: BorderRadius.circular(15))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Date of Birth",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 140,
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          label: Text(
                            "05-07-2024",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF77B60B)),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.maps_home_work),
                  Text(
                    "City",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextFormField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              controller: city,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF77B60B)),
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_imageBytes != null) {
                    profiledata[0].createimg = _imageBytes!;
                    profiledata[0].save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Profile image updated successfully")),
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Bottomuser(selecteddindex: 2)));
                  }
                  saveDetails();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF77B60B),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(10, 50)),
                child: const Text("Save Detalis "),
              ),
            )
          ],
        ),
      ),
    );
  }
}
