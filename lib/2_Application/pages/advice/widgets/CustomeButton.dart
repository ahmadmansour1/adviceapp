import 'package:adviceapp/2_Application/pages/Bloc/advisor_bloc.dart';
import 'package:adviceapp/2_Application/pages/Cubit/advisor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.onTap, super.key});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: (){
        BlocProvider.of<AdvisorCubit>(context).getAdvice();
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: onTap == null ? themeData.colorScheme.errorContainer : themeData.colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.displayLarge,
            ),
          ),
        ),
      ),
    );
  }
}