import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    return Observer(
      builder: (_){
        return Container(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                  ),
                  child:TabBar(
                    isScrollable: false,

                    onTap: (index){
                      controller.changePage(index);
                    },
                    indicatorColor: Colors.transparent,
                    labelColor: blackColor,
                    tabs: <Widget>[
                      Tab(
                          child: Text("Publicações",
                            style: TextStyle(
                              color: controller.selectedIndex == 0 ? secondaryColor : blankColor,
                              fontSize: 16,
                              fontFamily: controller.selectedIndex == 0 ? "AvenirLTStd Black" : "AvenirLTStd Light",
                            ),
                          ),
                        ),
                     Tab(
                          child: Text("Pedidos",
                            style: TextStyle(
                              color: controller.selectedIndex == 1 ? secondaryColor : blankColor,
                              fontSize: 16,
                              fontFamily: controller.selectedIndex == 1 ? "AvenirLTStd Black" : "AvenirLTStd Light",
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
                      )
                  ),
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
          builder: (_){
            if(controller.listPublication != null && controller.listPublication.value != null) {
              var list = controller.listPublication.value.reversed.toList();
              return Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 14, left: 24, right: 24),
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return PublicationCardWidget(list[index]);
                    }
                ),
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
    return Container(
    );
  }
}
