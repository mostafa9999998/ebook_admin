import 'dart:html';
import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AddProvider extends ChangeNotifier {

  File? _pdfFile;
  File? _imageFile;
  //late Book book;
  //late String imageurl ;
  //late String pdfurl ;






  Future<String> _uploadFile(File file) async {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = storageRef.putBlob(Blob([file.slice()]));
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }

    // geturl()async{
    //   pdfurl = await _uploadFile(_pdfFile!);
    //   imageurl  = await _uploadFile(_imageFile!);
    // }

    // Upload files to Firebase Storage





  // void setbook( String title, String Author, String category,
  //       String pdfUrl, String imageUrl) {
  //
  // book = Book(title: title,
  //     category: category,
  //     Author: Author,
  //     imageUrl: imageUrl,
  //     pdfUrl: pdfUrl
  // );
  //   }



  void addbook(GlobalKey<FormState> formKey,String title, String Author, String category, File? _pdfFile,File? _imageFile) async {

      if (formKey.currentState!.validate()) {
        if (_pdfFile == null || _imageFile == null) {
          // Handle missing files
          return;
        }

        // Upload files to Firebase Storage
        final pdfUrl = await _uploadFile(_pdfFile!);
        final imageUrl = await _uploadFile(_imageFile!);

        //Create a new book object
        final book = Book(title: title,
              category: category,
              Author: Author,
              imageUrl: imageUrl,
              pdfUrl: pdfUrl
          );
        FirebaseUtils.addbook(book);
        print('object saved successfly');
      }

      }


}
