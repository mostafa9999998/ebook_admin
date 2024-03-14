import 'dart:html';
import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:ebook_admin/view%20model/providers/add%20provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
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

   File? _pdfFile;
   File? _imageFile;
  // late Book book;

  @override
  Widget build(BuildContext context) {
    AddProvider provider =AddProvider();
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
                Center(child: Text('Add New Book', style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold,))),
                Container(
                  height: 30,
                ),
                Row(
                  children: [
                    Text('Name', style: TextStyle(
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
                    Text('Category', style: TextStyle(
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
                    Text('Author name', style: TextStyle(
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
                        _pickImageFile();
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .3,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .065,
                    child: ElevatedButton(
                      onPressed: () => _pickPdfFile(),
                      child: Text('Pick pdh'),
                    ),
                  ),
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
                        provider.addbook(formKey, namecontroller.text, authorcontroller.text, categorycontroller.text,
                            _pdfFile, _imageFile);
                      },
                      child: Text('Add book .'),
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

  Future<void> _pickImageFile() async {
    // File? mediaData = await ImagePickerWeb.getImage(outputType: ImageType.file);
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.length == 1) {
        final image = files[0];

        setState(() {
          _imageFile = image;
        });
      }
    });
  }



  Future<void> _pickPdfFile() async {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.accept = 'application/pdf';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.length == 1) {

        setState(() {
          _pdfFile = files[0];
        });
      }
    });
  }


  // Future<void> _pickPdfFile() async {
  //   FileUploadInputElement uploadInput = FileUploadInputElement();
  //   uploadInput.accept = 'application/pdf';
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((e) {
  //     final files = uploadInput.files;
  //     if (files != null && files.length == 1) {
  //       setState(() {
  //         _pdfFile = files[0];
  //       });
  //     }
  //   });
  // }
  //
  // Future<void> _pickImageFile() async {
  //  // File? mediaData = await ImagePickerWeb.getImage(outputType: ImageType.file);
  //   FileUploadInputElement uploadInput = FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((e) {
  //     final files = uploadInput.files;
  //     if (files != null && files.length == 1) {
  //       final image = files[0];
  //       setState(() {
  //         _imageFile = image;
  //       });
  //     }
  //   });
  //
  //
  //   Future<String> _uploadFile(File file) async {
  //     final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //     final storageRef = firebase_storage.FirebaseStorage.instance.ref().child(fileName);
  //     final uploadTask = storageRef.putBlob(Blob([file.slice()]));
  //     final snapshot = await uploadTask.whenComplete(() => null);
  //     final downloadUrl = await snapshot.ref.getDownloadURL();
  //     return downloadUrl;
  //   }
  //
  //   // Upload files to Firebase Storage
  //   final pdfUrl = await _uploadFile(_pdfFile!);
  //   final imageUrl = await _uploadFile(_imageFile!);
  //
  //    book = Book(title: namecontroller.text,
  //       category: categorycontroller.text,
  //       Author: authorcontroller.text,
  //       imageUrl: imageUrl,
  //       pdfUrl: pdfUrl
  //   );
  //
  //
  //
  //
  // }
  //
  // void addbook(Book book) {
  //   if (book != null){
  //     FirebaseUtils.addbook(book);
  //
  //   }
  //   else{
  //     print('n');
  //   }
  // }
}

