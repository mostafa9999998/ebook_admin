import 'dart:typed_data';
import 'package:ebook_admin/view%20model/providers/update%20provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../fire base/modules/Book.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key,required this.book});
  Book book ;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController categorycontroller = TextEditingController();

  TextEditingController authorcontroller = TextEditingController();

  Uint8List? _pdfFile;
  Uint8List? _imageFile;

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.book!.title!;
    categorycontroller.text = widget.book!.category!;
    authorcontroller.text = widget.book!.Author!;
  }
  @override
  Widget build(BuildContext context) {
    UpdateProvider provider = UpdateProvider();
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('Change Book', style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold,))),
                  Container(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('change title', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .1,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'title'
                          ),
                          controller: namecontroller,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return "title can't be empty";
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('change Category', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .072,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Ex : history'
                          ),
                          controller: categorycontroller,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return "category can't be empty";
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('change Author name', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .04,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Author'
                          ),
                          controller: authorcontroller,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return "Author name can't be empty";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 100,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .2,
                          child: Image.network(widget.book.imageUrl!)),
                      SizedBox(
                        width:MediaQuery
                            .of(context)
                            .size
                            .width * .1,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .3,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .065,
                        child: ElevatedButton(
                          onPressed: () async {
                            provider.pickImageFile(_imageFile);
                          },
                          child: Text('Select another Image'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .065,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.pickPdfFile(_pdfFile);
                        },
                        child: Text('Pick another  pdh'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {
                          provider.updatebook(context,formKey, widget.book.id!, namecontroller.text, authorcontroller.text, categorycontroller.text, _pdfFile, _imageFile);
                        },
                        child: Text('Updat book .',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
