import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_controller.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';
import 'package:megahackapp/app/shared/constants.dart';

class CreatePublicationScreen extends StatefulWidget {
  @override
  _CreatePublicationScreenState createState() =>
      _CreatePublicationScreenState();
}

class _CreatePublicationScreenState extends State<CreatePublicationScreen> {
  final controller = CreatePublicationController();
  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category category in categories) {
      items.add(DropdownMenuItem(
        value: category,
        child: Text(category.description),
      ));
    }
    return items;
  }

  @override
  void initState() {
    controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text(
          "Criar Publicação",
          style: TextStyle(
              color: primaryColor,
              fontFamily: "AvenirLTStd Roman",
              fontSize: 22),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () async{
                  var status = await controller.createPublication();
                  if(status == "falha"){
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text('Algo deu errado :('),
                    ));
                  } else {
                  Navigator.of(context).pop();
                  }
                },
                child: Center(
                  child:  Text("PUBLICAR", style: TextStyle(color: primaryColor, fontSize: 16),),
                )
            ),
          )
        ],
      ),
      body: Column(
          children: <Widget>[
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              onChanged: controller.changeDescription,
                              obscureText: false,
                              style: TextStyle(
                                color: primaryColor,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.create,
                                  color: primaryColor,
                                  size: 24,
                                ),
                                border: InputBorder.none,
                                hintText: "Faça aqui sua publicação",
                                hintStyle: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
    );
  }
}
