import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fares_project/addpage.dart';
import 'package:fares_project/contact.dart';
import 'package:fares_project/cours.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
          },icon: const Icon(Icons.add_circle_outline, color: Colors.black,),)
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "images/logo.png",
          height: 80,
          width: 120,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/back.png",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discover Our Courses",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(const Color.fromARGB(255, 136, 16, 56)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(9)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          child: const Text(
                            "View More",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Column(
                    //   children: [
                    //     Image.asset("images/angular.jpg"),
                    //     const SizedBox(height: 10,),
                    //     const Text("Spring Boot / Angular", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                    //     const SizedBox(height: 10,),
                    //     const Text("350 DT/Month", style: TextStyle(color: Color.fromARGB(255, 168, 5, 59,), fontWeight: FontWeight.w500),),
                    //     const SizedBox(height: 20,),
                    //   ],
                    // ),
                
               Container(
         height: 350,
          width: double.infinity,
           child: StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance.collection('course').snapshots(),
             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
            return Text('Something went wrong');
            }
           
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
            }
              return 
                    GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,  
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return 
                       Column(
                        children: [
                             Image.network(
            data["imgLink"],
            height: MediaQuery.of(context).size.height * 0.12,
            fit: BoxFit.cover,
            
                      ),
                    
                          const SizedBox(height: 8,),
                           Text(data['name'], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                          const SizedBox(height: 8,),
                           Text(data['price'], style: const TextStyle(color: Color.fromARGB(255, 168, 5, 59,), fontWeight: FontWeight.w500),),
                          const SizedBox(height: 20,),
                        ],
                      );
                      }).toList(),
                    );
            },
           ),
               ),
        
                    const SizedBox(
                      height: 20,
                    ),
        
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 169, 43),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: 18  ,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Contact(text: "Name", hintText: "Jiara Martins"),
                          Contact(
                              text: "Email",
                              hintText: "hello@reallygreatsite.com"),
                          Contact(
                              text: "Message",
                              hintText: "Write your mesage here"),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromARGB(255, 185, 25, 78)),
                              padding:
                                  MaterialStateProperty.all(const EdgeInsets.all(12)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9))),
                            ),
                            child: const Text(
                              "Send the message",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const  SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  , const SizedBox(height: 20,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
