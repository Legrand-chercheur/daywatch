import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:daywatch/Lecteur.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page_details extends StatefulWidget {
  var Plus;
  Page_details({required this.Plus});

  @override
  State<Page_details> createState() => _Page_detailsState();
}
bool fav = false;
final List<String> marimaunial = [
  'Saison 1',
  'Saison 2',
];
class _Page_detailsState extends State<Page_details> {

  List<dynamic> dataList = [];

  Future getData(String id_serie) async {
    final uri =
    Uri.parse('https://emploie.alwaysdata.net/daywatch/controller_api.php');
    var reponse = await http.post(uri,body: {
      'clic':'episode',
      'id_serie':id_serie,
    });
    setState(() {
      dataList = jsonDecode(reponse.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData(widget.Plus['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150),bottomRight: Radius.circular(150)),
                          image: DecorationImage(
                              image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+widget.Plus['image_serie']),
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
                            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30, bottom: 10),
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
                          Text(widget.Plus['nom_serie'], style: TextStyle(
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
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(27, 27, 27, 1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('Telecharger',style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),)),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/2.5,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                  ),
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      fillColor: Colors.red,
                                      //Add isDense true and zero Padding.
                                      iconColor: Color.fromRGBO(204, 36, 44, 1),
                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      //Add more decoration as you want here
                                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Choisir la saison',
                                      style: TextStyle(
                                          fontSize: 14,
                                        color: Color.fromRGBO(27, 27, 27, 1),
                                      ),
                                    ),
                                    items: marimaunial
                                        .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Choisir la saison.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      // selectedValue1 = value.toString();
                                      // print(selectedValue1);
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding: EdgeInsets.only(left: 20, right: 10),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 30,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Column(
                              children: dataList.map((data) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/1.1,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(27, 27, 27, 1),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+widget.Plus['image_serie']),
                                                  fit: BoxFit.cover
                                                ),
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                              width: MediaQuery.of(context).size.width/3,

                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(data['titre'],style: TextStyle(
                                                color: Colors.white
                                              ),),
                                              Text(data['duree']+' min',style: TextStyle(
                                                color: Colors.white
                                              ),),
                                            ],
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                            child: Icon(Icons.file_download_outlined, color: Colors.red,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
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
                        child: Icon(CupertinoIcons.play_fill,color: Colors.white,),
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
