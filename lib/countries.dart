
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Countreis extends StatefulWidget {
String id ;
String name ; 
Countreis({@required this.id,this.name});

@override
_CountriesState createState() => _CountriesState();


}

class _CountriesState extends State<Countreis> {
Map _map;
List country;
List countries = [];

Future<List> getCountry ()async {
  final String response = await rootBundle.loadString('json/data.json');
  final data = await json.decode(response);
  setState(() {
      _map = data['countries'];
      country  = _map.values.toList();
    });

  for(var i =0 ; i<country.length ; i++){
    var countryOfCon = country[i]['continent'];
    if (widget.id == countryOfCon){
      countries.add(country[i]);
    }
  } 
return countries;
}

@override
void initState(){
  getCountry();
  super.initState();
}

@override
Widget build(BuildContext context){
  return Scaffold(
      appBar: AppBar(
        title: Text('COW ',style: TextStyle(letterSpacing: 10),),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
            //  onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.orangeAccent,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          
                          title: Text(countries[index]['name']),
                         // subtitle: Text(
                           //   '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  
            ),
          ],
        ),
      ),
    );   
}
}
//Text(countries[index]["name"],style: TextStyle(
  //                           color: Colors.green,fontSize: 15),);
