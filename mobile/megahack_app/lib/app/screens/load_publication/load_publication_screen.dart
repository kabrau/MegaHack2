import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/screens/load_publication/load_publication_controller.dart';
import 'package:megahackapp/app/shared/components/publication_card.dart';
import 'package:megahackapp/app/shared/constants.dart';

class LoadPublicationScreen extends StatefulWidget {
  final Publication publication;
  LoadPublicationScreen(this.publication);
  @override
  _LoadPublicationScreenState createState() => _LoadPublicationScreenState();
}

class _LoadPublicationScreenState extends State<LoadPublicationScreen> {
  final controller = LoadPublicationController();
  var like = false;
  @override
  void initState() {
    controller.fetchComment(this.widget.publication.uid);
    controller.getCurrentUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text(
          this.widget.publication.request != 1 ?
          "Publicação de ${this.widget.publication.nameUser}" :
          "Respostas de ${this.widget.publication.nameUser}",
          style: TextStyle(
              color: primaryColor,
              fontFamily: "AvenirLTStd Roman",
              fontSize: 22),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:10,left: 10,right: 10, bottom: 0 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: this.widget.publication.urlAvatar != null ?
                                        NetworkImage("$APP_URL/images/${this.widget.publication.urlAvatar}") :
                                        AssetImage("assets/images/$unknownAvatar"),
                                        fit: BoxFit.cover
                                    )),
                              ),
                              Container(
                                width: 200,
                                child:  Text(this.widget.publication.nameUser ?? "",
                                  style: TextStyle(
                                      fontSize: 15, color: blackColor,
                                      fontFamily: "AvenirLTStd Light"),
                                  maxLines: 1 ,

                                ),
                              )
                            ],
                          ),
                          Text("1 hora atrás" ?? "",
                              style: TextStyle(
                                  fontSize: 12, color: grey4Color))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Divider(
                        color: greyColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:  Container(
                        child: Text(this.widget.publication.description),
                      ),
                    ),
                    this.widget.publication.urlImage != null && this.widget.publication.urlImage != "" ? Container(
                      color: greyColor,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: EdgeInsets.only(top: 10),
                      child: Image.network("$APP_URL/images/${this.widget.publication.urlImage}", fit: BoxFit.scaleDown,),
                    ) : Container(),
                    Padding(
                      padding: EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          this.widget.publication.request != 1 ? GestureDetector(
                            onTap: (){
                              setState(() {
                                like = like ? false : true;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(like ? Icons.favorite : Icons.favorite_border, color: Color(0xffC10000),),
                                Text(like ? "10": "  9",
                                  style: TextStyle(
                                      color: grey3Color
                                  ),
                                ),
                              ],),
                          ): Container(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text( this.widget.publication.request != 1 ? "Comentários": "Respostas", style: TextStyle(
                              color: primaryColor,
                              fontSize: 16
                          ),)
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_){
                        if(controller.listComment != null && controller.listComment.value != null){
                          var list = controller.listComment.value;
                          return Container(
                            height: MediaQuery.of(context).size.height/2,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: list.length,
                                itemBuilder: (context,index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(right: 10),
                                                      width: 45.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: list[index].avatarUrl != null && list[index].avatarUrl != "" ? NetworkImage(
                                                                  "$APP_URL/images/${list[index].avatarUrl}") :
                                                              AssetImage(
                                                                  "assets/images/$unknownAvatar"),
                                                              fit: BoxFit.cover)),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      child: Container(
                                                        margin: EdgeInsets.only(right: 10),
                                                        width: 12.0,
                                                        height: 12.0,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff04CC00),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text("${list[index].userName}",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: blackColor,
                                                        fontFamily: "AvenirLTStd Light")),
                                              ],
                                            ),
                                            Text("1 hora atrás" ?? "",
                                                style: TextStyle(fontSize: 12, color: grey4Color))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child:  Container(
                                          child: Text(list[index].description),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              bottomSender(),
            ],
          )
    );
  }
  Widget bottomSender(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera, color: secondaryColor,),
            onPressed: () async{

            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
              onChanged: controller.changeComment,
              onSubmitted: (text) async{
                var status = await controller.createComment(
                    this.widget.publication.uid);
                if (status == "falha") {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('Algo deu errado :('),
                  ));
                } else {
                  controller.fetchComment(this.widget.publication.uid);
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              var status = await controller.createComment(
                  this.widget.publication.uid);
              if (status == "falha") {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text('Algo deu errado :('),
                ));
              } else {
                controller.fetchComment(this.widget.publication.uid);
              }
            }
          )
        ],
      ),
    );
  }
}
