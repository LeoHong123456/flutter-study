import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 30,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              print("ABCDE>>>>");
            },
          ),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          width: double.infinity,
          // height: 200,
          color: const Color.fromARGB(66, 136, 132, 132),
          child: Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
                "https://img1.baidu.com/it/u=2807279870,132508324&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
                fit: BoxFit.cover),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                  height: 180,
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Image.network(
                          "https://img1.baidu.com/it/u=3429340352,2056379802&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=893",
                          fit: BoxFit.cover))),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Image.network(
                                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Faffd9f5e-75f5-4859-b155-616ec08d36e0%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1688460397&t=4ebeab64fdeae7da092ba284a58ecd05",
                                fit: BoxFit.cover))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Image.network(
                                "https://img2.baidu.com/it/u=3742051440,3532963313&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
                                fit: BoxFit.cover))),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
