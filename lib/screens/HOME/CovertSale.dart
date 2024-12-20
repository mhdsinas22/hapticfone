// ignore: file_names
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/Calacutions/calacution_functyions.dart';
import 'package:haptic_fone/textFormfileds/textformfikedconvertsalemdoel.dart';
import 'package:haptic_fone/dummy/dummy.dart';
import 'package:haptic_fone/screens/EXTRA/invoice_Add.dart';
import 'package:image_picker/image_picker.dart';

class Covertsale extends StatefulWidget {
  final Function(Map<String, dynamic>) onaddsale;
  final String convertsalebrand;
  final String covertmodel;
  final String covnvertSalecolor;
  final String convertsaleStroage;
  final String convertsalecondtion;
  final Uint8List? convertsaleimg;
  final String convertprice;
  final String convertpusrcheamontu;
  const Covertsale(
      {super.key,
      required this.convertsalebrand,
      required this.covertmodel,
      required this.covnvertSalecolor,
      required this.convertsaleStroage,
      required this.convertsalecondtion,
      required this.onaddsale,
      required this.convertsaleimg,
      required this.convertprice,
      required this.convertpusrcheamontu});

  @override
  State<Covertsale> createState() => _CovertsaleState();
}

class _CovertsaleState extends State<Covertsale> {
  List<Map<String, dynamic>> addmuiltsale = [];
  TextEditingController brandcontroller = TextEditingController();
  TextEditingController covertmodelcontroller = TextEditingController();
  TextEditingController covertsalecolrcontroller = TextEditingController();
  TextEditingController covertsaleStroagecontroller = TextEditingController();
  TextEditingController covertsalecondtioncontroller = TextEditingController();
  TextEditingController covertemplyename = TextEditingController();
  TextEditingController covertitemcount = TextEditingController();
  TextEditingController convertsaleprcice = TextEditingController();
  TextEditingController pushcamnout = TextEditingController();
  @override
  void initState() {
    super.initState();
    brandcontroller.text = widget.convertsalebrand;
    covertmodelcontroller.text = widget.covertmodel;
    covertsalecolrcontroller.text = widget.covnvertSalecolor;
    covertsaleStroagecontroller.text = widget.convertsaleStroage;
    covertsalecondtioncontroller.text = widget.convertsalecondtion;
    convertsaleprcice.text = widget.convertprice;
    pushcamnout.text = widget.convertpusrcheamontu;
    covertitemcount.text = "1";
  }

  File? image;
  Future<void> pickimage() async {
    final picker = ImagePicker();
    // ignore: non_constant_identifier_names
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      } else {}
    });
  }

  String? selectedbrand;
  String? selectedcondtion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 60,
                        color: Color(0xFF77B60B),
                      ),
                    ),
                    Container(
                      width: 30,
                    ),
                    const Text(
                      "SALE CONVERT",
                      style: TextStyle(
                          color: Color(0xFF77B60B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  pickimage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF77B60B))),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          image == null
                              ? Expanded(
                                  child: Image.memory(
                                    widget.convertsaleimg ?? Uint8List(0),
                                    width: 250,
                                    height: 140,
                                  ),
                                )
                              : const Column(
                                  children: [],
                                ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormfiledconvert(
                  hint: "",
                  controller2: brandcontroller,
                  keybordtype: TextInputType.text,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormfiledconvert(
                      keybordtype: TextInputType.text,
                      hint: "",
                      controller2: covertmodelcontroller)),
              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormfiledconvert(
                      keybordtype: TextInputType.text,
                      hint: "",
                      controller2: covertsalecolrcontroller)),
              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormfiledconvert(
                      keybordtype: TextInputType.text,
                      hint: "",
                      controller2: covertsaleStroagecontroller)),
              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormfiledconvert(
                      keybordtype: TextInputType.text,
                      hint: "",
                      controller2: covertsalecondtioncontroller)),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          upadtedtotalprice1(covertitemcount, pushcamnout,
                              widget.convertpusrcheamontu);
                          upadtedtotalprice(covertitemcount, convertsaleprcice,
                              widget.convertprice, widget.convertpusrcheamontu);
                        },
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        controller: covertitemcount,
                        decoration: InputDecoration(
                          label: const Text("Item Count"),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFF77B60B))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        controller: convertsaleprcice,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFF77B60B))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    width: 130,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () async {
                        final newitem = {
                          "brand": widget.convertsalebrand,
                          "Image": widget.convertsaleimg,
                          "Model": covertmodelcontroller.text,
                          "itemcount": int.parse(covertitemcount.text),
                          "Color": covertsalecolrcontroller.text,
                          "Straoge": covertsaleStroagecontroller.text,
                          "Price": convertsaleprcice.text,
                          "Condtion": covertsalecondtioncontroller.text,
                          "PurshcePrice": pushcamnout.text
                        };
                        Dummy.addmuiltsale.add(newitem);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MulipliteSale(
                                  onaddsale: widget.onaddsale,
                                  totalamount: pushcamnout.text,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(30, 10),
                          backgroundColor: const Color(0xFF77B60B),
                          foregroundColor: Colors.white),
                      child: const Text('CONVERT'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
