import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  var data;

   Profile(this.data) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data['name']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Username",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data['username']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )),
                Expanded(
                    child: Text(

                      "${data['address']['street']}, ${data['address']['suite']}, ${data['address']['city']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                      textAlign: TextAlign.end,
                    )),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Zipcode",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data['address']['zipcode']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
