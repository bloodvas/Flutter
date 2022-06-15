import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _title = 'Counter';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget._title,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://sun1-24.userapi.com/MYDSI8n3DhJqo_SyUpKvEcp1ek4kuM9704c9Ow/e94BXW81dKA.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Color.fromARGB(59, 0, 0, 0),
          appBar: AppBar(
              title: Text(widget._title.toUpperCase()),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 32, 166, 255)),
          body: RefreshIndicator(
            key: _refreshKey,
            onRefresh: () async {
              await Future<void>.delayed(const Duration(seconds: 1));
              setState(() {
                count = 0;
              });
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(maxHeight: 1000),
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 50)),
                              onPressed: () => setState(() {
                                    count++;
                                  }),
                              child: const Text('+',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Counter: $count',
                            style: const TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 50)),
                              onPressed: () => setState(() {
                                    count--;
                                  }),
                              child: const Text('-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))))
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   child: const Text('Clear'),
        //   onPressed: () => {
        //     _refreshKey.currentState?.show(),
        //   },
        // ),
      ),
    );
  }
}
