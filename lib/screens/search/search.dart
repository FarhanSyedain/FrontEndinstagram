import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  final searchController = TextEditingController();

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      backwardsCompatibility: false,
      brightness: Brightness.light,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: TextField(
          controller: searchController,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 30,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 14,
              ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withAlpha(150),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withAlpha(150),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor.withAlpha(150),
            ),
          ),
        ),
      ),
    );
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var results;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: results == null
          ? Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Type in something to search',
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('test.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        'farhansyedain',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      subtitle: Text(
                        'Farhan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor.withAlpha(200),
                          
                        ),
                      ),
                    ),
                  );
                },
                itemCount: results.length + 12,
              ),
            ),
    );
  }
}
