import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_screen.dart';
import 'package:megahackapp/app/screens/search/search_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = SearchController();

  @override
  void initState() {
    // TODO: implement initState
    controller.fecthCompany();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Procurar", style: TextStyle(color: primaryColor, fontFamily: "AvenirLTStd Roman",
            fontSize: 22),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: primaryColor
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Icon(Icons.search, color: primaryColor, size: 24),
                  Text(" Procurar ")
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Serviços perto de você!")
                ),
                Observer(
                  builder: (_){
                    if(controller.listCompany != null && controller.listCompany.value != null) {
                      var list = controller.listCompany.value;
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(

                                      builder: (context) => BusinessDetailScreen(list[index])));
                                },
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: 200,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_1280.jpg", fit: BoxFit.cover, )
                                    )
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primaryColor)),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Categoria")
                ),
                Observer(
                  builder: (_){
                    if(controller.listCompany != null && controller.listCompany.value != null) {
                      var list = controller.listCompany.value;
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(

                                      builder: (context) => BusinessDetailScreen(list[index])));
                                },
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: 200,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_1280.jpg", fit: BoxFit.cover, )
                                    )
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primaryColor)),
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
