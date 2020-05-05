import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/screens/load_publication/load_publication_screen.dart';
import 'package:megahackapp/app/screens/my_publication/my_publication_controller.dart';
import 'package:megahackapp/app/shared/components/publication_card.dart';
import 'package:megahackapp/app/shared/constants.dart';

class MyPublicationScreen extends StatefulWidget {
  @override
  _MyPublicationScreenState createState() => _MyPublicationScreenState();
}

class _MyPublicationScreenState extends State<MyPublicationScreen> {
  final controller = MyPublicationController();

  @override
  Widget build(BuildContext context) {
    controller.fetchPublication();
    controller.fetchRequest();
    return Observer(
      builder: (_) {
        return Container(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: TabBar(
                    isScrollable: false,
                    onTap: (index) {
                      controller.changePage(index);
                    },
                    indicatorColor: Colors.transparent,
                    labelColor: blackColor,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Publicações",
                          style: TextStyle(
                            color: controller.selectedIndex == 0
                                ? secondaryColor
                                : blankColor,
                            fontSize: 16,
                            fontFamily: controller.selectedIndex == 0
                                ? "AvenirLTStd Black"
                                : "AvenirLTStd Light",
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Pedidos",
                          style: TextStyle(
                            color: controller.selectedIndex == 1
                                ? secondaryColor
                                : blankColor,
                            fontSize: 16,
                            fontFamily: controller.selectedIndex == 1
                                ? "AvenirLTStd Black"
                                : "AvenirLTStd Light",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: blankColor,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          myPublications(),
                          myRequests(),
                        ],
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myPublications() {
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) {
            if (controller.listPublication != null &&
                controller.listPublication.value != null) {
              var list = controller.listPublication.value;
              return Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 14, left: 24, right: 24),
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(list[index].uid),
                        onDismissed:(direction){
                            controller.deletePublication(list[index].uid);
                        },
                        background: Container(
                          decoration: BoxDecoration(
                           color: Colors.redAccent,
                           borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(Icons.delete, color: blankColor,),
                              )
                            ],
                          ),
                        ),
                        direction: DismissDirection.startToEnd,
                        child: PublicationCardWidget(list[index], () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadPublicationScreen(list[index])));
                        }),
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
    );
  }

  Widget myRequests() {
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) {
            if (controller.listRequest != null &&
                controller.listRequest.value != null) {
              var list = controller.listRequest.value;
              return Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 14, left: 24, right: 24),
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return requestCard(list[index]);
                    }),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }

  Widget requestCard(Publication publication) {
    return Dismissible(
      key: Key(publication.uid),
      onDismissed:(direction){
        controller.deletePublication(publication.uid);
      },
      background: Container(
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(Icons.delete, color: blankColor,),
            )
          ],
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
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
                                  image: publication.urlAvatar != null
                                      ? NetworkImage(
                                          "$APP_URL/images/${publication.urlAvatar}")
                                      : AssetImage(
                                          "assets/images/$unknownAvatar"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            publication.nameUser ?? "",
                            style: TextStyle(
                                fontSize: 15,
                                color: blackColor,
                                fontFamily: "AvenirLTStd Light"),
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    Text("1 hora atrás" ?? "",
                        style: TextStyle(fontSize: 12, color: grey4Color))
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
                child: Container(
                  child: Text(publication.description),
                ),
              ),
              publication.urlImage != null &&publication.urlImage != ""
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: EdgeInsets.only(top: 10),
                      child: Image.network(
                        "$APP_URL/images/${publication.urlImage}",
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : Container(),
              Padding(
                padding:
                    EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoadPublicationScreen(publication)
                            )
                        );},
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            " Respostas",
                            style: TextStyle(color: grey3Color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
