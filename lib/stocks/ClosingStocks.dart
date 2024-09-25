import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';
import 'package:hariyali_abhiyan/stocks_subcomponents/addclosingstocks.dart';

class ClosingStocks extends StatefulWidget {
  const ClosingStocks({super.key});

  @override
  State<ClosingStocks> createState() => _ClosingStocksState();
}

class _ClosingStocksState extends State<ClosingStocks> {
  List <Map <String, String>> categories=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppBar(),
      drawer: const CustomDrawer(), // Use your custom Drawer
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add some padding for better layout
        child: Column(
          children: [
            Row( 
              children: [
                const Text(
                  'Closing Stocks',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Addclosingstocks(onCategoryAdded: (newCategories){
                      setState(() {
                        categories.add(newCategories);
                      });
                    })));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Closing Stocks',style: TextStyle(color: Colors.white, fontSize: 13.0),),
                  
                )
              ],
            ),
            const SizedBox(height: 10.0,),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(border:Border.all(width: 1.0)),
              child:const Text('No record found',style: TextStyle(fontSize: 20.0),),

            )


            
          ],
        ),
      ),
    );
  }
}
