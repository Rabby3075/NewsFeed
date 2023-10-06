import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   Widget _PortraitLayout(){
     return ListView.builder(
       itemCount: 10,
       itemBuilder: (context, index) {
         return Column(
           children: [
             Card(
               elevation: 4, // Add elevation (shadow) here
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(5), // Customize the border radius
               ),
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: 150,
                 child: Center(
                   child: Image.network(
                     'https://via.placeholder.com/150',
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
             ),
             SizedBox(height: 16.0), // Adjust the height as needed for the gap
           ],
         );
       },
     );
   }
   Widget _LandscapeLayout(){
     return GridView.builder(
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2, // Minimum 2 columns
       ),
       itemCount: 10,
       itemBuilder: (context, index) {
         return Card(
           elevation: 4, // Add elevation (shadow) here
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5), // Customize the border radius
           ),
           child: Container(
             width: MediaQuery.of(context).size.width / 2, // Adjust as needed
             height: 150,
             child: Center(
               child: Image.network(
                 'https://via.placeholder.com/150',
                 fit: BoxFit.cover,
               ),
             ),
           ),
         );
       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _PortraitLayout()
              : _LandscapeLayout();
        },
      )
    );
  }
}
