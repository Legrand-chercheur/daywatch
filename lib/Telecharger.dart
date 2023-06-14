import 'package:flutter/material.dart';


class MyDownloading extends StatefulWidget {
  const MyDownloading({Key? key}) : super(key: key);

  @override
  State<MyDownloading> createState() => _MyDownloadingState();
}

class _MyDownloadingState extends State<MyDownloading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text('Franck',style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}
