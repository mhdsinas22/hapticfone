import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_functions.dart';
import 'package:haptic_fone/dropdownitems/items_brand.dart';
import 'package:haptic_fone/dropdownitems/items_condtion.dart';
import 'package:haptic_fone/Stockmange/StockmangeBottomnav.dart';
import 'package:haptic_fone/Stockmange/textformfiledforAdd.dart';
import 'package:haptic_fone/textFormfileds/TextFormfiled.dart';
import 'package:image_picker/image_picker.dart';

class StockAdd extends StatefulWidget {
  final Function(Map<String, dynamic>) onaddstock;
  final ValueNotifier<String> selectedvalue;
  final Function(String) onselected;
  const StockAdd(
      {super.key,
      required this.onaddstock,
      required this.selectedvalue,
      required this.onselected});

  @override
  State<StockAdd> createState() => _StockAddState();
}

class _StockAddState extends State<StockAdd> {
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController color = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Storage = TextEditingController();
  TextEditingController itemcount = TextEditingController();
  TextEditingController perpiece = TextEditingController();
  TextEditingController pusrshceamount = TextEditingController();
  // File? _image;
  late String dropdownvalue;

  // Future<void> pickimage() async {
  //   final picker = ImagePicker();
  //   // ignore: non_constant_identifier_names
  //   final PickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (PickedFile != null) {
  //       _image = File(PickedFile.path);
  //     } else {}
  //   });
  // }
  Uint8List? _imageBytes;

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
    // TODO: implement initState
    super.initState();
    dropdownvalue = widget.selectedvalue.value;
  }

  String? selectedbrand;
  String? selectedcondtion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StockBottom()));
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 50,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "ADD STOCK",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: pickImage,
                  child: Container(
                    width: 250,
                    height: 160,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey[200],
                    ),
                    child: _imageBytes != null
                        ? Image.memory(_imageBytes!, fit: BoxFit.cover)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add_photo_alternate, size: 50),
                              SizedBox(height: 10),
                              Text("Add Image",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     pickImage();
                //   },
                //   child: Container(
                //       decoration: BoxDecoration(
                //           color: Colors.white, border: Border.all()),
                //       width: 250,
                //       height: 160,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           _image != null
                //               ? Expanded(
                //                   child: Image.file(
                //                     _image!,
                //                     width: 250,
                //                     height: 140,
                //                   ),
                //                 )
                //               : Column(
                //                   children: [
                //                     IconButton(
                //                         onPressed: () {
                //                           pickImage();
                //                         },
                //                         icon: const Icon(
                //                           Icons.insert_photo,
                //                           size: 50,
                //                         )),
                //                     const Text(
                //                       "Add image",
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold),
                //                     )
                //                   ],
                //                 ),
                //         ],
                //       )),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedbrand,
                    items: itemsbrands.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedbrand = value;
                      });
                    },
                    dropdownColor: Colors.white,
                    focusColor: Colors.white,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Select the Brand",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: model,
                    hint: "Enter the model name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: color,
                    hint: "Enter the color name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Textformfiledforadd(
                    controller1: Storage,
                    hint: "Enter the Storage name",
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          labelText: "Select the Condtion",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder()),
                      value: selectedcondtion,
                      items: itemscondtion.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedcondtion = value;
                        });
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFilekeybioramdnumddd(
                      hintnum: "Purschase Amount",
                      controllernumkeyborad: pusrshceamount),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 160,
                      height: 50,
                      child: TextFormFilekeybioramdnumddd(
                          controllernumkeyborad: itemcount, hintnum: "item ")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: TextFormFilekeybioramdnumddd(
                        hintnum: "Per Piece Price",
                        controllernumkeyborad: perpiece),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        // widget.onselected(dropdownvalue);
                        if (_imageBytes != null) {
                          addStock(
                              image: _imageBytes!,
                              brand: selectedbrand ?? "",
                              model: model.text,
                              color: color.text,
                              storage: Storage.text,
                              condition: selectedcondtion ?? "",
                              itemCount: itemcount.text,
                              price: perpiece.text,
                              onAddStock: widget.onaddstock,
                              purshscaeprice: pusrshceamount.text);

                          // Clearing the text fields
                          brand.clear();
                          model.clear();
                          color.clear();
                          Storage.clear();
                          itemcount.clear();
                          perpiece.clear();
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text("ADD"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
