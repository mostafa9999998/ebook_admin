import 'package:ebook_admin/pakages/vertical%20tab%20view.dart';
import 'package:ebook_admin/view/Ui/admin%20panel/add%20wedget/add%20wedget.dart';
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: VerticalTabView(
                  tabsWidth:  MediaQuery.of(context).size.width*.25,
                  tabs: <Tab>[
                    Tab(child: Text('Add',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.cyan)),),
                    Tab(child: Text('Update',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.cyan),)),
                    Tab(child: Text('Delete',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.cyan),)),
                    Tab(child: Text('Access Users',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.cyan),)),
                  ],
                  contents: <Widget>[
                    AddBook(),
                    AddBook()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
