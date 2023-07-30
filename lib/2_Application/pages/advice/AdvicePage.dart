import 'package:adviceapp/2_Application/core/services/Services_Theme.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/CustomeButton.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/advice_field.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/error_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advice' , style: themeData.textTheme.headline1),
        centerTitle: true,
        actions: [
          Switch(value: Provider.of<ThemeService>(context).isDarkModeOn ,
              onChanged:(_){
                Provider.of<ThemeService>(context , listen: false).toggleTheme();

              })
        ],
      ),
      body: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 50),
        child:  Column(
          children:  [
            Expanded(child: Center(
              child:ErrorMessage(message: 'oops somthing went wrong '),
            )),
            SizedBox(
                height: 200,
                child: Center(child: CustomButton())),
          ],
        ),
      )
    );
  }
}
