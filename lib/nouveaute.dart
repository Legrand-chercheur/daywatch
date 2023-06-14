import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Class/Data.dart';

class Mate extends StatefulWidget {
  const Mate({super.key});

  @override
  State<Mate> createState() => _MateState();
}
List<Film_Avenir_And_Nouveau> _List_Nouveau = <Film_Avenir_And_Nouveau>[];

Future<List<Film_Avenir_And_Nouveau>> Recuperer_Nouveaute() async{
  final uri = Uri.parse('https://emploie.alwaysdata.net/daywatch/controller_api.php');
  var reponse = await http.post(uri, body:{
    'clic':'film',
  });
  var nouveau =<Film_Avenir_And_Nouveau>[];
  final datas = json.decode(reponse.body);
  for (var data in datas){
    nouveau.add(Film_Avenir_And_Nouveau.fromjson(data));
  }
  return nouveau;
}
class _MateState extends State<Mate> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Recuperer_Nouveaute().then((value){
      setState(() {
        _List_Nouveau.addAll(value);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: Column(
        children: [
          SizedBox(height: 18,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nouveautes',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.person,color: Colors.white,),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _List_Nouveau.length,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('30',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          Text('Nov', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      SizedBox(width: 2,),
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(27, 27, 27, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+_List_Nouveau[index].image_film),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_List_Nouveau[index].nom_film, style: TextStyle(
                                    color: Colors.white
                                  ),),
                                  Column(
                                    children: [
                                      Icon(Icons.notifications_active,color: Colors.white,),
                                      Text('Me rappeler',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text('Disponible le 25 decembre',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top: 8),
                              child: Text(_List_Nouveau[index].description,style: TextStyle(
                                color: Colors.white,
                              ),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
