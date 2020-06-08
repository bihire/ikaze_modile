import 'package:flutter/material.dart';

class TransportMenuBody extends StatelessWidget {
  const TransportMenuBody({Key key}) : super(key: key);

  void _tripShowModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        
        backgroundColor: Colors.transparent,
        builder: (context) =>
            DraggableScrollableSheet(
              initialChildSize: 0.64,
              minChildSize: 0.2,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  // color: Colors.white,
                  decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    itemCount: 20,
                  ),
                );
              },
            ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return  
          ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text('Kigali', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),),
                  ),
                  InkWell(
                    onLongPress: () => {
                      _tripShowModalBottomSheet(context)
                    },
                    onTap: () => {},
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: Container(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(child: Text('201', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600))),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('20 active buses', style: TextStyle(color: Color(0xFFd9d9d9)),),),
                              ],),
                              Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('Kicukiro(saint-joseph) - Down town'),),
                                
                              ],),
                              const Divider(
                                color: Color(0xFFD9D9D9),
                                thickness: .5,
                              ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(child: Text('201', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600))),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('20 active buses', style: TextStyle(color: Color(0xFFd9d9d9)),),),
                              ],),
                              Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('Kicukiro(saint-joseph) - Down town'),),
                                
                              ],),
                              const Divider(
                                color: Color(0xFFD9D9D9),
                                thickness: .5,
                              ),
                            ],)
                        )
                      )
                    ),
                  ),
                  
                ],
                )
            ),
            Text('data'),
        ],
    );
  }
}
