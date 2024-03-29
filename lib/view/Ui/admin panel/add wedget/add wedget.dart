import 'dart:typed_data';
import 'package:ebook_admin/view%20model/providers/add%20provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBook extends StatefulWidget {
  AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController categorycontroller = TextEditingController();

  TextEditingController authorcontroller = TextEditingController();

  Uint8List? _pdfFile;
  Uint8List? _imageFile;

  // late Book book;

  @override
  Widget build(BuildContext context) {
    AddProvider provider = AddProvider();
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text('Add New Book',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ))),
                Container(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'name'),
                        controller: namecontroller,
                        validator:(value) {
                          if (value!.isEmpty || value.trim().isEmpty) {
                            return "title can't be empty";
                          }
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .072,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Ex : history'),
                          controller: categorycontroller,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return "category can't be empty";
                            }
                          }),
                    )
                  ],
                ),
                Container(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Author name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .04,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Author'),
                          controller: authorcontroller,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return "Author name can't be empty";
                            }
                          }),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .065,
                    child: ElevatedButton(
                      onPressed: () async {
                        _imageFile = await provider.pickImageFile();
                      },
                      child: Text('Select Image'),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .065,
                    child: ElevatedButton(
                      onPressed: () async{
                        _pdfFile = await provider.pickPdfFile();
                      },
                      child: Text('Pick pdh'),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        provider.addbook(
                            context,
                            formKey,
                            namecontroller.text,
                            authorcontroller.text,
                            categorycontroller.text,
                            _pdfFile,
                            _imageFile);
                      },
                      child: Text(
                        'Add book .',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





}
