import 'package:adviceapp/2_Application/core/services/Services_Theme.dart';
import 'package:adviceapp/2_Application/pages/Cubit/advisor_cubit.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/CustomeButton.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/advice_field.dart';
import 'package:adviceapp/2_Application/pages/advice/widgets/error_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injectionDependency.dart';


class AdvisorPageProvider extends StatelessWidget {
  const AdvisorPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvisorCubit>(),
      child: const AdvicePage(),
    );
  }
}


class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Advice', style: themeData.textTheme.headline1),
          centerTitle: true,
          actions: [
            Switch(value: Provider
                .of<ThemeService>(context)
                .isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(child: Center(
                child: BlocBuilder<AdvisorCubit, AdvisorCubitState>(
                  builder: (context, state) {
                   if(state is AdvisorInitial){
                   return   Text('your advice is waiting for yoy ' , style: themeData.textTheme.headline1);
                   }
                   else if(state is AdvisorLoading){
                     return  CircularProgressIndicator(
                       color: themeData.colorScheme.secondary,
                     );
                   }
                   else if(state is AdvisorLoaded){
                     return AdviceField(advice: state.advice);
                   }
                   else if (state is AdvisorError){
                     return ErrorMessage(message: state.message);
                   }
                   return const SizedBox();


                  },
                ),
              )),
              const SizedBox(
                  height: 200,
                  child: Center(child: CustomButton())),
            ],
          ),
        )
    );
  }
}
