import 'package:flutter/material.dart';

class TaggedIn extends StatelessWidget {
  final show = false;
  @override
  Widget build(BuildContext context) {
    return show
        ? GridView.builder(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                color: Colors.orange,
              );
            },
            itemCount: 30,
          )
        : Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Not tagged in any post',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
