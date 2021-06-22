import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  hintText: 'Search',
                  focusColor: Colors.black,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Color.fromRGBO(191, 192, 193, 1),
                )),
          )
        ],
      ),
    );
  }
}
