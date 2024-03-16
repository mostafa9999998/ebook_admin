import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:ebook_admin/view/Utils/alert%20dialogs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';


class AddProvider extends ChangeNotifier {

  Future<Uint8List?> pickImageFile() async {
    final image = await ImagePickerWeb.getImageAsBytes();

    if (image != null) {
        return image;
    }else{
      return null;
    }

  }

  Future<Uint8List?> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
    return  result.files.first.bytes;
    }else{
      return null;
    }
  }

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



  void addbook(BuildContext context,GlobalKey<FormState> formKey,String title, String Author, String category, Uint8List? _pdfFile,Uint8List? _imageFile) async {

      if (formKey.currentState!.validate()) {
        showLoading(context);
        if (_pdfFile == null || _imageFile == null) {
          hideLoading(context);
          showmsg(context, 'image or pdf not entered');
        } else {
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
          hideLoading(context);
          showsucsses(context, 'book added successfly');
        }

      }

      }


}
