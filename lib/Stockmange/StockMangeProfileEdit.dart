// import 'package:flutter/material.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.chevron_left,
//                       size: 40,
//                     )),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black,
//                       border: Border.all()),
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundImage: AssetImage(
//                       "assest/1.jpg",
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: 150,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: Text("Change Image"),
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15))),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Your Name"),
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Mobile Number"),
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Email"),
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Icon(Icons.calendar_today),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Date of Birth",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),
//                   Container(
//                     width: 155,
//                     child: Expanded(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                             label: Expanded(
//                               child: Expanded(
//                                 child: Text(
//                                   "05-07-2024",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13),
//                                 ),
//                               ),
//                             ),
//                             suffixIcon: Icon(Icons.calendar_month),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Icon(Icons.maps_home_work),
//                   Text(
//                     "City",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 50,
//               width: 100,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: Text("Save Detalis "),
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     side: BorderSide(),
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     minimumSize: Size(10, 50)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    // Screen Width and Height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            // Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Profile Image and Change Button
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(),
                  ),
                  child: CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: AssetImage("assest/1.jpg"),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Change Image"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            // Form Fields
            buildLabel("Your Name"),
            buildTextFormField(),
            buildLabel("Mobile Number"),
            buildTextFormField(),
            buildLabel("Email"),
            buildTextFormField(),

            // Date of Birth Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    "Date of Birth",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "05-07-2024",
                        suffixIcon: Icon(Icons.calendar_month),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // City Section
            buildLabelWithIcon("City", Icons.maps_home_work),
            buildTextFormField(),

            // Save Button
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Save Details"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildLabelWithIcon(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
