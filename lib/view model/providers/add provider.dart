import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AddProvider extends ChangeNotifier {

  Future<String> _uploadimage(Uint8List image) async {

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child(fileName);
    final metadata = firebase_storage.SettableMetadata(contentType: 'image/jpeg');
    final uploadTask = storageRef.putData(image!,metadata);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadFile(Uint8List file) async {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      final metadata = firebase_storage.SettableMetadata(contentType: 'application/pdf');
      final uploadTask = storageRef.putData(file!,metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }



  void addbook(GlobalKey<FormState> formKey,String title, String Author, String category, Uint8List? _pdfFile,Uint8List? _imageFile) async {

      if (formKey.currentState!.validate()) {
        if (_pdfFile == null || _imageFile == null) {
          // Handle missing files
          return;
        }

        // Upload files to Firebase Storage
        final pdfUrl = await _uploadFile(_pdfFile!);
        final imageUrl = await _uploadimage(_imageFile!);

        //Create a new book object
        final book = Book(title: title,
              category: category,
              Author: Author,
              imageUrl: imageUrl,
              pdfUrl: pdfUrl
          );
        FirebaseUtils.addbook(book);
        print('add successfly');
      }

      }


}
