import 'package:flutter/material.dart';

class Cour extends StatefulWidget {
  String imageLink;
  String courName;
  String price;
  
   Cour({super.key,required this.imageLink, required this.courName, required this.price});

  @override
  State<Cour> createState() => _CourState();
}

class _CourState extends State<Cour> {
  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      Image.asset(widget.imageLink, width: MediaQuery.of(context).size.width *0.45,), 
                       const SizedBox(height: 10,), 
                       Text(widget.courName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),), 
                      const  SizedBox(height: 10,), 
                       Text(widget.price, style: const TextStyle(color: Color.fromARGB(255, 168, 5, 59,), fontWeight: FontWeight.w500),), 
                         const SizedBox(height: 20,),                    ],
                  );
  }
}