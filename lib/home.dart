import 'package:avtaar/model/data.dart';
import 'package:avtaar/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'details.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab = 0;

  void _onTabSelected(int position) {
    setState(() => _selectedTab=position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.blueGrey[900]),
          onPressed: () => SystemNavigator.pop()
        ),
        title: Text(
          'Lessons',
          style: TextStyle(color: Colors.blueGrey[900]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/bg.png',
                  width: 30.0,
                ),
                Text(
                  '10',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomTabbar(onTabSelected: _onTabSelected),
              Expanded(
                child: ListView.builder(
                  itemCount: Data.lessons[_selectedTab].length,
                  itemBuilder: (context, i) => Container(
                    height: 130.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Details(Data.lessons[_selectedTab][i]))),
                            child: Card(
                              margin: const EdgeInsets.all(10.0),
                              elevation: 7.0,
                              shadowColor: Colors.grey[200].withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'assets/images/${Data.lessons[_selectedTab][i].image}',
                                            width: 75,
                                            height: 75,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          child: Container(
                                            height: 75.0,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  Data.lessons[_selectedTab][i].title,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0
                                                  ),
                                                ),
                                                const SizedBox(height: 10.0),
                                                Text(
                                                  Data.lessons[_selectedTab][i].title,
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          child: InkWell(
                                            child: Icon(Data.lessons[_selectedTab][i].isBookmarked ? Icons.bookmark : Icons.bookmark_border_rounded), 
                                            onTap: () => setState(() => Data.lessons[_selectedTab][i].isBookmarked = !Data.lessons[_selectedTab][i].isBookmarked)
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Container(
                                      child: Row(
                                        children: [
                                          for (int j=0;j<3;j++)
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 3.0,
                                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                  color: (j+1) <= Data.lessons[_selectedTab][i].completedStages ? 
                                                    const Color(0xFF77B048) : Colors.grey,
                                                  borderRadius: BorderRadius.circular(10.0)
                                                ),
                                              ),
                                            )
                                        ]
                                      )
                                    )
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          i%2==0 ? Icons.lock_open : Icons.lock_outline,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }
}