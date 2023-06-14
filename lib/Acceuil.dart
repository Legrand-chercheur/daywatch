import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daywatch/details_series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'Recherche.dart';
import 'details_films.dart';
import 'package:http/http.dart' as http;

class principal extends StatefulWidget {
  const principal({Key? key}) : super(key: key);

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  Future Films()async{
    final uri =
    Uri.parse('https://emploie.alwaysdata.net/daywatch/controller_api.php');
    var reponse = await http.post(uri,body: {
      'clic':'film',
    });
    return json.decode(reponse.body);
  }

  Future Series()async{
    final uri =
    Uri.parse('https://emploie.alwaysdata.net/daywatch/controller_api.php');
    var reponse = await http.post(uri,body: {
      'clic':'series',
    });
    print(reponse.body);
    return json.decode(reponse.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Films();
    Series();

  }

  @override
  Widget build(BuildContext context) {
    List? film;
    List? films;
    List? series;
    List? vous;

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        shadowColor: CupertinoColors.black,
        title: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('img/Hiei-smaller.jpeg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/DayWatch Main Logo 2400x1800.png')
                  )
                )
              ),
              IconButton(
                  onPressed: (){
                    Navigator.push(context, SizeTransition5(SecondPage()));
                  },
                  icon: Icon(Icons.search,color: Colors.white,)
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('https://emploie.alwaysdata.net/daywatch/image/titan s1.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('https://emploie.alwaysdata.net/daywatch/image/dragon  ball super.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('https://emploie.alwaysdata.net/daywatch/image/gardien1.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ],
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.8,
              aspectRatio: 16/9,
              initialPage: 0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(
                seconds: 5
              ),
              autoPlayAnimationDuration: Duration(
                milliseconds: 800
              ),
              autoPlayCurve: Curves.decelerate
            )),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 23,),
                Text('Series',style: TextStyle(color: Colors.white),),
              ],
            ),
            Container(
                height: 240,
                child: FutureBuilder(
                    future: Series(),
                    builder: (context, snapshot){
                      series = snapshot.data;
                      if(series == null){
                        return getShimmerLoading();
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: series!.length,
                            itemBuilder: (context, element){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Page_details(Plus: series![element])));
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 280,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+series![element]['image_serie']),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 184,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(27, 27, 27, 1),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                          ),
                                          child: Center(
                                            child: Text(series![element]['nom_serie'],
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
                            });
                      }
                    })
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 23,),
                Text('Films',style: TextStyle(color: Colors.white),),
              ],
            ),
            Container(
                height: 240,
                child: FutureBuilder(
                    future: Films(),
                    builder: (context, snapshot){
                      films = snapshot.data;
                      if(films == null){
                        return getShimmerLoading();
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: films!.length,
                            itemBuilder: (context, element){
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Page_details_series(Plus : films![element])));
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+films![element]['image_film']),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(27, 27, 27, 1),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                          ),
                                          child: Center(
                                            child: Text(films![element]['nom_film'],
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
                            });
                      }
                    })
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 23,),
                Text('Pour vous',style: TextStyle(color: Colors.white),),
              ],
            ),
            Container(
                height: 240,
                child: FutureBuilder(
                    future: Series(),
                    builder: (context, snapshot){
                      vous = snapshot.data;
                      if(vous == null){
                        return getShimmerLoading();
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: vous!.length,
                            itemBuilder: (context, element){
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 300,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            image: DecorationImage(
                                                image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+vous![element]['image_serie']),
                                                fit: BoxFit.cover
                                            )
                                        ),

                                      ),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(27, 27, 27, 1),
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child: Text(vous![element]['nom_serie'],
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
                              );
                            });
                      }
                    })
            ),
          ],
        ),
      ),
    );

  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: 150,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Container(
              height: 240,
              width: 150,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Container(
              height: 240,
              width: 150,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
