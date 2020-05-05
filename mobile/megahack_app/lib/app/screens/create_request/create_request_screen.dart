import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/screens/create_request/create_request_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class CreateRequestScreen extends StatefulWidget {
  @override
  _CreateRequestScreenState createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final controller = CreateRequestController();
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
    // TODO: implement initState
    controller.fetchCategory();
    controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text(
          "Criar Pedido",
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
                onTap: ()async{
                  var status = await controller.createRequest();
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_){
                if(controller.listCategory.value != null && controller.listCategory != null){
                var _dropDownMenuItems = buildDropdownMenuItems(controller.listCategory.value);
                return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 0),
                          child: Row(
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
                                    hintText: "Faça aqui seu pedido",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<Category>(
                                    hint: Text("Selecione uma Categoria"),
                                    elevation: 10,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: secondaryColor,
                                        fontSize: 14,
                                        fontFamily: "AvenirLTStd Light"
                                    ),
                                    iconEnabledColor: secondaryColor,
                                    items: _dropDownMenuItems,
                                    onChanged: (Category value) {
                                      setState(() {
                                        controller.selectedCategory = value;
                                      });
                                    },
                                    value: controller.selectedCategory,
                                  ),
                                  Text("Categorias")
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ));
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),

          ],
        ),
      ),
    );
  }
}
