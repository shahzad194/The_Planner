import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          top(),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),

          ),

        ],
      ),
    );
  }
}

top() {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      )
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  // backgroundImage: ,
                ),
                SizedBox(width: 10),
                Text("Hi Shahzad", style: TextStyle(color: Colors.white)),
              ],
            ),
            IconButton(
                icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {  },)
          ],
        ),
        SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
            hintText: "Search",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.filter_list),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),

            )
          ),
        )


      ],


    )



  );
}



//       appBar: AppBar(),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text("Shahzad Aslam"),
//               accountEmail: Text("shahzad1122@gmail.com"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text(
//                   "S",
//                   style: TextStyle(fontSize: 40.0),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home), title: Text("Order Completed"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings), title: Text("Cancel Booking"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contacts), title: Text("Pending Order"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contacts), title: Text("Booked Hall"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Row(
//           children: [
//             SizedBox(height: 14.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: "Search By City",
//                     hintStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
//                     prefixIcon: Icon(Icons.search, color: Colors.black87,),
//                     fillColor: Colors.blueGrey,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14.0),
//                       borderSide: BorderSide.none,
//                     )
//                 ),
//               ),
//             ),
//           Container(
//             width: 200.0,
//             height: 100.0,
//             color: Colors.green,
//             child: Text("Hello! I am in the container widget", style: TextStyle(fontSize: 25)),
//           ),
//           ],
//
//         ),
//       ),
//
//     );
//   }
// }
//
// // 