import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/company_model.dart';

class CompanySearch extends SearchDelegate<String>{
  Future<List<Company>> list;
  CompanySearch(this.list);
  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result base on the select
    Future.delayed(Duration.zero).then((_)=>close(context, query));

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? list : searchList(query);
    return FutureBuilder<List<Company>>(
      future: suggestionList,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else{
          return ListView.builder(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(snapshot.data[index].name),
                leading: Icon(Icons.business),
                onTap: (){
                  close(context, snapshot.data[index].name);
                },
              );
            },
            itemCount: snapshot.data.length,
          );
        }
      },
    );
  }
  Future<List<Company>> searchList(String search){
    return list.then((value) => value.where((element) => element.name.toUpperCase().startsWith(query.toUpperCase())).toList());
  }

}