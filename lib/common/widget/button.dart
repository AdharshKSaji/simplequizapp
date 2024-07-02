import 'package:flutter/material.dart';
import 'package:simplequizapp/view/core/constants/colorconstants.dart';



class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTap, required this.label, required this.isSkip});
  final void Function()? onTap;
  final String label;
  final bool isSkip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSkip
              ? ColorConstants.primaryGrey
              : ColorConstants.primaryBlue.withOpacity(onTap == null ? 0.2 : 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}