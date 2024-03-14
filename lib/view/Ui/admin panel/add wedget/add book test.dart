// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:image_picker_web/image_picker_web.dart';
//
// // class Book {
// //   final String title;
// //   final String author;
// //   final String pdfUrl;
// //   final String imageUrl;
// //
// //   Book({
// //     required this.title,
// //     required this.author,
// //     required this.pdfUrl,
// //     required this.imageUrl,
// //   });
// // }
//
//
//
// class BookForm extends StatefulWidget {
//   @override
//   _BookFormState createState() => _BookFormState();
// }
//
// class _BookFormState extends State<BookForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String _title;
//   late String _author;
//   File? _pdfFile;
//   File? _imageFile;
//
//   Future<void> _pickPdfFile() async {
//     FileUploadInputElement uploadInput = FileUploadInputElement();
//     uploadInput.accept = 'application/pdf';
//     uploadInput.click();
//
//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;
//       if (files != null && files.length == 1) {
//         setState(() {
//           _pdfFile = files[0];
//         });
//       }
//     });
//   }
//
//   Future<void> _pickImageFile() async {
//    // File? mediaData = await ImagePickerWeb.getImage(outputType: ImageType.file);
//
//     //if (mediaData == null) {
//       // User canceled the picker
//       //return;
//     //}
//
//     setState(() {
//       //_imageFile = mediaData;
//     });
//   }
//
//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       if (_pdfFile == null || _imageFile == null) {
//         // Handle missing files
//         return;
//       }
//
//       // Upload files to Firebase Storage
//       final pdfUrl = await _uploadFile(_pdfFile!);
//       final imageUrl = await _uploadFile(_imageFile!);
//
//       //Create a new book object
//       final book = Book(
//         title: _title,
//         author: _author,
//         pdfUrl: pdfUrl,
//         imageUrl: imageUrl,
//       );
//
//       // TODO: Save the book object to Firestore or perform any other desired actions
//       // You can use the Firebase Firestore package to store the book details.
//
//       // Reset form and file selections
//       _formKey.currentState!.reset();
//       setState(() {
//         _pdfFile = null;
//         _imageFile = null;
//       });
//     }
//   }
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
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Title'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a title';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _title = value!;
//             },
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Author'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter an author';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _author = value!;
//             },
//           ),
//           ElevatedButton(
//             onPressed: _pickPdfFile,
//             child: Text('Select PDF'),
//           ),
//           if (_pdfFile != null) Text('Selected PDF: ${_pdfFile!.name}'),
//           ElevatedButton(
//             onPressed: _pickImageFile,
//             child: Text('Select Image'),
//           ),
//           if (_imageFile != null) Text('Selected Image: ${_imageFile!.name}'),
//           ElevatedButton(
//             onPressed: _submitForm,
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
// // f ren succsess
// /*Future<void> uploadImage(File image) async {
//     try {
//       image.name;
//       firebase_storage.FirebaseStorage storage =
//           firebase_storage.FirebaseStorage.instance;
//       firebase_storage.Reference storageReference =
//       storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
//       firebase_storage.UploadTask uploadTask = storageReference.putBlob(Blob([image.slice()]));
//
//       await uploadTask.whenComplete(() => print('Image uploaded successfully'));
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
//
//   Future<void> _pickImage(BuildContext context) async {
//     FileUploadInputElement uploadInput = FileUploadInputElement();
//     uploadInput.accept = 'image/*';
//     uploadInput.click();
//
//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;
//       if (files != null && files.length == 1) {
//         final image = files[0];
//         uploadImage(image);
//       }
//     });
//   }*/