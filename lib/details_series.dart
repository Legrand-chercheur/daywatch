import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'Class/Data.dart';
import 'Lecteur.dart';

class Page_details_series extends StatefulWidget {
  var Plus;
  Page_details_series({required this.Plus});

  @override
  State<Page_details_series> createState() => _Page_details_seriesState();
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
bool fav = false;
class _Page_details_seriesState extends State<Page_details_series> {

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150),bottomRight: Radius.circular(150)),
                          image: DecorationImage(
                              image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+widget.Plus['image_film']),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(34, 34, 34, 1),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(27, 27, 27, 1),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(fav == false){
                                            fav = true;
                                          }else{
                                            fav = false;
                                          }
                                          print(fav);
                                        });
                                      },
                                      child: Icon(fav == false ?Icons.favorite_border:Icons.favorite, color: fav == false ? Colors.white:Color.fromRGBO(204, 36, 44, 1),
                                      )),
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(27, 27, 27, 1),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Icon(Icons.share, color: Colors.white,),
                                ),
                              ],
                            ),
                          ),
                          Text(widget.Plus['nom_film'], style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Annee',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    Text('data',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Pays',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    Text('data',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Duree',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    Text('data',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Text('Bande annonce',style: TextStyle(
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/1.05,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Text('Titre similaires',style: TextStyle(
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _List_Nouveau.length,
                                itemBuilder: (context, element){
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0,bottom:15.2),
                                    child: GestureDetector(
                                      onTap: (){
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Page_details(Plus: series![element])));
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 194,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+_List_Nouveau[element].image_film),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 194,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(27, 27, 27, 1),
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text(_List_Nouveau[element].nom_film,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height *0.5 - (MediaQuery.of(context).size.width *0.08),
                  left: MediaQuery.of(context).size.width * 0.43,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Lecteur(place: widget.Plus['fichier'])));
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 36, 44, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(CupertinoIcons.play_arrow_solid,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
