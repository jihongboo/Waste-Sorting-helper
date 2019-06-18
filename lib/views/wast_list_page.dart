import 'package:flutter/material.dart';
import 'package:waste_sorting_helper/model/wast_model.dart';

class SortListPage extends StatelessWidget {
  final WastModel wastModel;

  SortListPage(this.wastModel);

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: Colors.grey[300],
      height: 1,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(wastModel.name),
        ),
        body: Scrollbar(
          child: ListView.separated(
            itemCount: wastModel.wasts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(
                wastModel.wasts[index].name,
              ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return divider;
            },
          ),
        ));
  }
}
