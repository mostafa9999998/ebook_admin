import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return const AlertDialog(
        content: Row(
          children: [
            Text('Loading...'),
            Spacer(),
            CircularProgressIndicator()
          ],
        ) ,
      );
    },
  );
}
void hideLoading(BuildContext context){
  Navigator.pop(context);
}
void showerror(BuildContext context,String errormessage,){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        title:Text('Error!') ,
        content: Text(errormessage) ,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text('Ok') )
        ],
      );
    },
  );
}
void showmsg(BuildContext context,String errormessage,){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        title:Text('Ops!') ,
        content: Text(errormessage) ,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text('Ok') )
        ],
      );
    },
  );
}

void showsucsses(BuildContext context,String message,){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        content: Text(message,style: TextStyle(fontSize: 18)) ,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text('Ok') )
        ],
      );
    },
  );
}
