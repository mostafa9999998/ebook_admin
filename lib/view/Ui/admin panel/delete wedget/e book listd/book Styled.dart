import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/Book.dart';
import 'package:ebook_admin/view/Ui/admin%20panel/uodate%20wedget/update/update%20wedget.dart';
import 'package:flutter/material.dart';

class BookStyled extends StatelessWidget {
  BookStyled({super.key,required this.book});
  Book book ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseUtils.deletebook(book.id!);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.007 ,vertical: MediaQuery.of(context).size.height*.02),
        decoration: BoxDecoration(
          border: Border.all(width: 3,color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.22,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book.imageUrl!),
                      fit: BoxFit.fill
                  )
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Text(book!.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Text(book!.category!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Row(
              children: [
                Spacer(),
                Text(book!.Author!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
