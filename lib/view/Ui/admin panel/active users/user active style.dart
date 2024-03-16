import 'package:ebook_admin/fire%20base/Firebase%20Utiles/fire%20Utils.dart';
import 'package:ebook_admin/fire%20base/modules/User.dart';
import 'package:ebook_admin/view/Utils/alert%20dialogs.dart';
import 'package:flutter/material.dart';

class UserActiveStyle extends StatelessWidget {
  UserActiveStyle({super.key,required this.user});
User user ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xab83c97d)
      ),
      height: MediaQuery.of(context).size.height*.15,
      child: Row(
        children: [
         Container(width: MediaQuery.of(context).size.width*.05,),
          Column(
            children: [
              Text(user.name!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height:  MediaQuery.of(context).size.height*.02,),
              Text(user.phone_number!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(
            width:  MediaQuery.of(context).size.width*.25,
          ),
          ElevatedButton(onPressed: ()async {
            print(user.id!);
            showLoading(context);
           await FirebaseUtils.activeuser(user.id!, context);
          },
              child:  Text('Active'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          SizedBox(
            width: 50,
          ),
          ElevatedButton(onPressed: () {
            showLoading(context);
            FirebaseUtils.deleteuser(user.id!, context);
          },
            child:  Text('cancel'),),
        ],
      ),
    );
  }
}
