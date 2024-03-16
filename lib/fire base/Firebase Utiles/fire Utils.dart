import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_admin/fire%20base/modules/User.dart';
import 'package:ebook_admin/view/Utils/alert%20dialogs.dart';
import 'package:flutter/cupertino.dart';
import '../modules/Book.dart';

class FirebaseUtils {

  static CollectionReference<Book> collection() {
    return FirebaseFirestore.instance
        .collection(Book.booksname)
        .withConverter<Book>(
            fromFirestore: (snapshot, option) =>
                Book.fromjeson(snapshot.data()!),
            toFirestore: (book, option) => book.tojeson());
  }
  static CollectionReference<User> usercollection() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<User>(
        fromFirestore: (snapshot, option) =>
            User.fromjeson(snapshot.data()!),
        toFirestore: (user, option) => user.tojeson());
  }

  static Future<void> addbook(Book book) {
    var bookkcollection = collection();
    var docs = bookkcollection.doc();
    book.id = docs.id;
    return docs.set(book);
  }

  static Future<void> updatebookstring(BuildContext context, String docid,
      String newtitle, String newautor, String newcategory) {
    return collection().doc(docid).update(
        {'title': newtitle, 'Author': newautor, 'category': newcategory}).then(
      (value) {
        print("book updated");
        hideLoading(context);
        showsucsses(context, 'book updated');
      },
    ).catchError((error) {
      print("Failed to updated: $error");
      hideLoading(context);
      showmsg(context, 'Failed to updated');
    });
  }

  static Future<void> updatebookimage(BuildContext context, String docid,
      String newtitle, String newautor, String newcategory, String newimgurl) {
    return collection().doc(docid).update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
      'imageUrl': newimgurl
    }).then(
      (value) {
        print("book updated");
        hideLoading(context);
        showsucsses(context, 'book updated');
      },
    ).catchError((error) {
      print("Failed to updated: $error");
      hideLoading(context);
      showmsg(context, 'Failed to updated');
    });
  }

  static Future<void> updatebookpdf(BuildContext context, String docid,
      String newtitle, String newautor, String newcategory, String newpdfurl) {
    return collection().doc(docid).update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
      'pdfUrl': newpdfurl
    }).then(
      (value) {
        print("book updated");
        hideLoading(context);
        showsucsses(context, 'book updated');
      },
    ).catchError((error) {
      print("Failed to updated: $error");
      hideLoading(context);
      showmsg(context, 'Failed to updated');
    });
  }

  static Future<void> updateallbook(
      BuildContext context,
      String docid,
      String newtitle,
      String newautor,
      String newcategory,
      String newpdfurl,
      String newimgurl) {
    return collection().doc(docid).update({
      'title': newtitle,
      'Author': newautor,
      'category': newcategory,
      'pdfUrl': newpdfurl,
      'imageUrl': newimgurl
    }).then(
      (value) {
        print("book updated");
        hideLoading(context);
        showsucsses(context, 'book updated');
      },
    ).catchError((error) {
      print("Failed to updated: $error");
      hideLoading(context);
      showmsg(context, 'Failed to updated');
    });
  }

  static Future<void> deletebook(BuildContext context, String bookid) {
    return collection().doc(bookid).delete().then((value) {
      print("book Deleted");
      hideLoading(context);
      showsucsses(context, 'book Deleted');
    }).catchError((error) {
      print("Failed to delete book: $error");
      hideLoading(context);
      showmsg(context, 'Failed to delete book');
    });
  }

  static Future<List<Book>> getbooklist() async {
    QuerySnapshot<Book> collec = await collection().get();
    List<Book> x = collec.docs.map((doc) {
      return doc.data();
    }).toList();
    return x;
  }
  static Future<List<User>> getuserlist() async {
    QuerySnapshot<User> collec = await usercollection().get();
    List<User> x = collec.docs.map((doc) {
      return doc.data();
    }).toList();

    List<User> unactiveuser = x.where((user) => user.active == false).toList();
    return unactiveuser;
  }


  static Future<void> activeuser(String uid,BuildContext context) {
    return usercollection().doc(uid).update({
      'active': true
    }).then(
          (value) {
        print("user activated");
        hideLoading(context);
        showsucsses(context, "user activated");
      },
    ).catchError((error) {
      print("Failed to active user: $error");
      hideLoading(context);
      showmsg(context, 'Failed to active');
    });
  }

  static Future<void> deleteuser(String uid,BuildContext context) {
    return usercollection().doc(uid).delete().then(
          (value) {
        print("user deleted");
        hideLoading(context);
        showsucsses(context, "user deleted");
      },
    ).catchError((error) {
      print("Failed to delete user: $error");
      hideLoading(context);
      showmsg(context, 'Failed to delete user');
    });
  }


}
