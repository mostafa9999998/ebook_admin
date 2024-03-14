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
    print ('sucsses');
    return docs.set(book);
  }
}