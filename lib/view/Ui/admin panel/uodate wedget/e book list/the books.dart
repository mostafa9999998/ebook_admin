import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/view/Ui/admin%20panel/uodate%20wedget/e%20book%20list/book%20Style.dart';
import 'package:flutter/material.dart';

class BooksListUpdate extends StatelessWidget {
  const BooksListUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwedth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenwedth / 300).floor();
    return Column(
          children: [
            Text(
              'e-book List',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            FutureBuilder(
              future: FirebaseUtils.getbooklist(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .9,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: .65,
                      ),
                      itemBuilder: (context, index) {
                        return BookStyle(book: snapshot.data![index]);
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        );
  }
}
