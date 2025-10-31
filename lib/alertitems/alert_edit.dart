import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/dropdownitems/items_brand.dart';
import 'package:haptic_fone/dropdownitems/items_condtion.dart';
import 'package:haptic_fone/Stockmange/textformfiledforAdd.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

void editalert(BuildContext context, int index, Function setState,
    List<StockItems> fetchitems) {
  StockItems current = fetchitems[index];
  final puschaeamount = TextEditingController(text: current.purschaseprice);
  final modelcontroller = TextEditingController(text: current.hivemodel);
  final colorcontroller = TextEditingController(text: current.hivecolor);
  final stroagecontoller = TextEditingController(text: current.hivestorage);
  final itemcountcontroller =
      TextEditingController(text: current.hiveitemcount);
  final perpricecontroller = TextEditingController(text: current.hiveprice);
  String updatedcondtion = current.hivecondtion;
  String updatedbrand = current.hivebrand;
  Uint8List? _updatedimage = current.hiveimg;
  // Future<void> _editimage() async {
  //   final picker = ImagePicker();
  //   final PickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (PickedFile != null) {
  //       _updatedimage = PickedFile;
  //     } else {
  //       print("No Image");
  //     }
  //   });
  // }
  Future<void> _editimage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Uint8List? imageBytes =
          await pickedFile.readAsBytes(); // Convert XFile to Uint8List
      _updatedimage = imageBytes; // Assign to your Uint8List variable
    }
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Edit Section"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _editimage();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      width: 250,
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _updatedimage != null
                              ? Expanded(
                                  child: Image.memory(
                                    _updatedimage!,
                                    width: 250,
                                    height: 140,
                                  ),
                                )
                              : Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _editimage();
                                        },
                                        icon: Icon(
                                          Icons.insert_photo,
                                          size: 50,
                                        )),
                                    Text(
                                      "Add image",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: DropdownButtonFormField<String>(
                        value: itemsbrands.contains(updatedbrand)
                            ? updatedbrand
                            : null,
                        items: itemsbrands.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            updatedbrand = newvalue!;
                          });
                        },
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Select the Brand",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder()),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: modelcontroller,
                    hint: "Enter the model name",
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          labelText: "Select the Condtion",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder()),
                      value: itemscondtion.contains(updatedcondtion)
                          ? updatedcondtion
                          : null,
                      items: itemscondtion.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          updatedcondtion = newvalue!;
                        });
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: stroagecontoller,
                    hint: "Enter the Storage name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: colorcontroller,
                    hint: "Enter the color name",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: puschaeamount,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Per Piece Price',
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 50,
                        child: Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: itemcountcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'item count',
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: perpricecontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Per Piece Price',
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancl"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fetchitems[index] = StockItems(
                      purschaseprice: puschaeamount.text,
                      hiveimg: _updatedimage ?? Uint8List(0),
                      hivebrand: updatedbrand,
                      hivemodel: modelcontroller.text,
                      hivecolor: colorcontroller.text,
                      hivestorage: stroagecontoller.text,
                      hivecondtion: updatedbrand,
                      hiveitemcount: itemcountcontroller.text,
                      hiveprice: perpricecontroller.text);
                  var box = Hive.box<StockItems>("stockitem_box");
                  int stockey = current.key as int;
                  // ignore: unnecessary_null_comparison
                  if (stockey == null) {
                    print("Key is null. Skipping update.");
                    return;
                  }
                  box.put(
                      stockey,
                      StockItems(
                          hiveimg: _updatedimage ?? Uint8List(0),
                          hivebrand: updatedbrand,
                          hivemodel: modelcontroller.text,
                          hivecolor: colorcontroller.text,
                          hivestorage: stroagecontoller.text,
                          hivecondtion: updatedcondtion,
                          hiveitemcount: itemcountcontroller.text,
                          hiveprice: perpricecontroller.text,
                          purschaseprice: puschaeamount.text));
                });
                Navigator.of(context).pop();
              },
              child: Text("Edit"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            )
          ],
        );
      });
}
