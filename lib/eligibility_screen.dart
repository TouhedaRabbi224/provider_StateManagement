import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'eligibility_screen_provider.dart';

class EligibilityScreen extends StatelessWidget {

  //const EligibilityScreen({Key? key}) : super(key: key);
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <EligibilityScreenProvider>(

        create: (context) => EligibilityScreenProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('Provide Demo'),
            ),
            body: Container(
                padding: EdgeInsets.all(16),
                child:Form(
                  child:Consumer<EligibilityScreenProvider>(
                    builder: (context ,provider,child){
                      //var ageController;
                      return Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: provider.isEligibile?Colors.green:Colors.redAccent,
                            ),
                            width: 50,
                            height: 50,

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: ageController,

                            decoration: InputDecoration(
                              hintText: 'Give your age',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16,),
                          Container(
                            width: double.infinity,
                            //color: Colors.blue,
                            child: ElevatedButton(

                              onPressed: (){
                               final int age= int.parse(ageController.text.trim());
                               provider.CheckEligibility(age);
                              },

                              child: Text('click',),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text(provider.message),
                        ],

                      );
                    }
                  )




                )
            ),
          );
        },
      ),
    );
  }
}
