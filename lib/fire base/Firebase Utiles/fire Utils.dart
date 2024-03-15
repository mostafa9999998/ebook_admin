import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/Book.dart';

class FirebaseUtils {

  static CollectionReference<Book> collection(){
    return
      FirebaseFirestore.instance.collection(Book.booksname).
      withConverter<Book>(
          fromFirestore:(snapshot,option) =>Book.fromjeson(snapshot.data()!),
          toFirestore: (book,option) => book.tojeson()
      );
  }


  static Future<void> addbook( Book book){
    var bookkcollection = collection();
    var docs =bookkcollection.doc();
     book.id = docs.id;
    return docs.set(book);
  }

 static Future<void> updatebookstring(String  docid ,String newtitle,String newautor,String newcategory ) {
    return collection()
        .doc(docid)
        .update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory
    })
        .then((value) => print("book updated"))
        .catchError((error) => print("Failed to updated: $error"));
  }

 static Future<void> updatebookimage(String  docid ,String newtitle,String newautor,String newcategory,String newimgurl ) {
    return collection()
        .doc(docid)
        .update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
        'imageUrl' : newimgurl
        })
        .then((value) => print("book updated"))
        .catchError((error) => print("Failed to updated: $error"));
  }

 static Future<void> updatebookpdf(String  docid ,String newtitle,String newautor,String newcategory,String newpdfurl ) {
    return collection()
        .doc(docid)
        .update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
      'pdfUrl' : newpdfurl
        })
        .then((value) => print("book updated"))
        .catchError((error) => print("Failed to updated: $error"));
  }

 static Future<void> updateallbook(String  docid ,String newtitle,String newautor,String newcategory,String newpdfurl ,String newimgurl) {
    return collection()
        .doc(docid)
        .update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
      'pdfUrl' : newpdfurl,
      'imageUrl' : newimgurl
        })
        .then((value) => print("book updated"))
        .catchError((error) => print("Failed to updated: $error"));
  }

 static Future<void> deletebook(String bookid) {
    return collection()
        .doc(bookid)
        .delete()
        .then((value) => print("book Deleted"))
        .catchError((error) => print("Failed to delete book: $error"));
  }

  static Future<List<Book>> getbooklist()  async {
  QuerySnapshot<Book> collec = await collection().get();
  List<Book> x = collec.docs.map((doc) {
    return doc.data();
  }).toList();
  return x ;
}

}