import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Blog App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        backgroundColor: Colors.blue,
        onPressed: (){
          Get.defaultDialog(
            title: "App in the developing Phase!",
            middleText: "....Stay Tuned...",
            backgroundColor: Colors.black45,
            titleStyle: const TextStyle(color: Colors.white60),
            middleTextStyle: const TextStyle(color: Colors.white54),
            radius: 30,
          );
        },
        child: const Icon(Icons.chat_bubble_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: screenDefault(width,height,context)



    );
  }
}


Widget screenDefault(double width,double height,BuildContext ctx){
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GridView.builder(

      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            // Get.to(() => DetailScreen(uniquetag: uniquetag,myblog:blog));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white10,
                ),

                child: Column(
                  children: [
                    SizedBox(
                      width: width/1.2,
                      height: MediaQuery.of(context).size.width<=600?height/2:height/4,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("img.png",width: double.infinity/1.08,height: height/1.2,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
                              return const Center(child:  Text('Image not available',style: TextStyle(fontSize: 20),));
                            },),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    child: const Icon(Icons.favorite,size: 30,color: Colors.white54)),
                                onTap: (){
                                  // setState(() {
                                  //   // blog.isFavourite = !blog.isFavourite;
                                  // });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width/1.01,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "Title",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20 ,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width/1.01,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "This description is for sample",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12 ,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(ctx).size.width > 850?3:MediaQuery.of(ctx).size.width > 600?2:1,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0
      ),
    ),
  );
}
