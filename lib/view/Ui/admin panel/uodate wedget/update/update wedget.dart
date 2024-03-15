import 'dart:typed_data';

import 'package:ebook_admin/view%20model/providers/update%20provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';
import '../../../../../fire base/modules/Book.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key,required this.book});
  Book book ;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController categorycontroller = TextEditingController();

  TextEditingController authorcontroller = TextEditingController();

  Uint8List? _pdfFile;
  Uint8List? _imageFile;

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.book!.title!;
    categorycontroller.text = widget.book!.category!;
    authorcontroller.text = widget.book!.Author!;
  }
  @override
  Widget build(BuildContext context) {
    UpdateProvider provider = UpdateProvider();
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('Change Book', style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold,))),
                  Container(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('change title', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .1,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'name'
                          ),
                          controller: namecontroller,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('change Category', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .072,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Ex : history'
                          ),
                          controller: categorycontroller,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('change Author name', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .04,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Author'
                          ),
                          controller: authorcontroller,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 100,
                          width: 80,
                          child: Image.network(widget.book.imageUrl!)),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .3,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .065,
                        child: ElevatedButton(
                          onPressed: () async {
                            _pickImageFile();
                          },
                          child: Text('Select another Image'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .065,
                      child: ElevatedButton(
                        onPressed: () {
                          pickPdfFile();
                        },
                        child: Text('Pick another pdh'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {
                          provider.updatebook(formKey, widget.book.id!, namecontroller.text, authorcontroller.text, categorycontroller.text, _pdfFile, _imageFile);
                        },
                        child: Text('Updat book .',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFile() async {
    final image = await ImagePickerWeb.getImageAsBytes();

    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  Future<void> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _pdfFile = result.files.first.bytes;
      });
    }
  }
}
