import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  String text;
  String hintText;
   Contact({super.key, required this.text , required this.hintText});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    decoration: InputDecoration(
                                      hintText:hintText ,
                                      enabledBorder:  OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color:   Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                                  
                          filled: true,
                                      contentPadding: const EdgeInsets.all(8),
                                    )),
                             const SizedBox(height: 8,),
                              ],
                            ),
                          )
                        ;
  }
}