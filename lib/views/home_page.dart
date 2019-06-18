import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_sorting_helper/model/wast_model.dart';
import 'package:waste_sorting_helper/providers/wast_provider.dart';
import 'package:waste_sorting_helper/views/wast_card.dart';
import 'package:waste_sorting_helper/views/wast_list_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WastProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("垃圾分类助手"),
      ),
      body: Column(
        children: <Widget>[
          SearchTextField(),
          if (provider.searchString == "") WastCollections() else SearchList()
        ],
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  final divider = Divider(
    color: Colors.grey[300],
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WastProvider>(context);

    return Expanded(
      child: Stack(
        children: <Widget>[
          Scrollbar(
            child: ListView.separated(
              itemCount: provider.searchKeywords.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    provider.searchKeywords[index],
                  ),
                  onTap: () {
                    focusNode.unfocus();
                    provider.searchWast(provider.searchKeywords[index]);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return divider;
              },
            ),
          ),
          if (provider.wastSearch != null) WastCard(provider.wastSearch),
        ],
      ),
    );
  }
}

FocusNode focusNode = FocusNode();

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WastProvider>(context);

    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.only(left: 14.0, right: 14.0),
        child: TextField(
          focusNode: focusNode,
          controller: _controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
              ),
              suffixIcon: GestureDetector(
                child: Container(
                  child: Icon(Icons.clear),
                ),
                onTap: () {
                  focusNode.unfocus();
                  _controller.text = "";
                  provider.searchString = "";
                },
              ),
              hintText: '输入垃圾名称'),
          onChanged: (str) {
            provider.searchString = str;
          },
        ),
      ),
    );
  }
}

class WastCollections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WastProvider>(context);
    return Expanded(
      child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: provider.wasts.length,
              itemBuilder: (context, index) {
                return WastCollectionCell(provider.wasts[index]);
              })),
    );
  }
}

class WastCollectionCell extends StatelessWidget {
  final WastModel wast;
  WastCollectionCell(this.wast);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(12.0),
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return SortListPage(wast);
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Icon(
                  wast.icon,
                  size: 24,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: wast.color,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Text(
                wast.wasts.length.toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            wast.name,
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          )
        ],
      ),
      color: Colors.white,
    );
  }
}
