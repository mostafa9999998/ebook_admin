import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:ebook_admin/view/Utils/alert%20dialogs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';


class UpdateProvider extends ChangeNotifier {

  Future<void> pickImageFile(Uint8List? _imageFile) async {
    final image = await ImagePickerWeb.getImageAsBytes();

    if (image != null) {
        _imageFile = image;
        notifyListeners();
    }
  }

  Future<void> pickPdfFile(Uint8List? _pdfFile) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
        _pdfFile = result.files.first.bytes;
      notifyListeners();
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



  void updatebook(BuildContext context,GlobalKey<FormState> formKey,String bookid,String title, String Author, String category, Uint8List? _pdfFile,Uint8List? _imageFile) async {

    if (formKey.currentState!.validate()) {
      showLoading(context);
      if (_pdfFile == null && _imageFile == null) {
        // Handle missing files
        FirebaseUtils.updatebookstring(context,bookid, title, Author, category);
        notifyListeners();
      }else if (_pdfFile == null && _imageFile != null ){
        final imageUrl = await _uploadimage(_imageFile!);
        FirebaseUtils.updatebookimage(context,bookid, title, Author, category, imageUrl);
        notifyListeners();
      }else if (_pdfFile != null && _imageFile == null){
        final pdfUrl = await _uploadFile(_pdfFile!);
        FirebaseUtils.updatebookpdf(context,bookid, title, Author, category, pdfUrl);
        notifyListeners();
      }else {
        final pdfUrl = await _uploadFile(_pdfFile!);
        final imageUrl = await _uploadimage(_imageFile!);
      FirebaseUtils.updateallbook(context,bookid, title, Author, category, imageUrl, pdfUrl);
        notifyListeners();
      }
      print('updated successfly');
    }

  }


}