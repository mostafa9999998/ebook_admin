import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/view/Ui/admin%20panel/active%20users/user%20active%20style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivUserList extends StatelessWidget {
  const ActivUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: FirebaseUtils.getuserlist(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: [
                  Text('Active user',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return UserActiveStyle(user: snapshot.data![index],);
                    },
                      itemCount: snapshot.data!.length,
                    ),
                  )
                ],
              ),
            );
          }
          else if(snapshot.hasError){
           return Center(child: Text(snapshot.error.toString()),);
          }
          else {
            return Center(
            child: CircularProgressIndicator(),
          );}
        },
    ) ;
  }
}
