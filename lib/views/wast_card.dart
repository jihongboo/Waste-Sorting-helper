import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_sorting_helper/model/wast_model.dart';
import 'package:waste_sorting_helper/providers/wast_provider.dart';

class WastCard extends StatelessWidget {
  final WastModel wast;
  WastCard(this.wast);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final provider = Provider.of<WastProvider>(context);
        provider.clearWastSearch();
      },
      child: Container(
        color: Colors.black12,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.grey[100]),
                    child: Text(
                      wast.name,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: wast.color),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                wast.icon,
                                color: Colors.white,
                                size: 50,
                              )),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(wast.describe),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: 300,
                      child: Text("${wast.name}主要包括"),
                      color: Colors.grey[100],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Text(wast.include),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: 300,
                      child: Text("${wast.name}主要包括"),
                      color: Colors.grey[100],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 12, right: 12),
                    child: Text(wast.requirement),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
