import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:stacked/stacked.dart';

class DetailView extends ViewModelWidget<ProfileViewModel> {
  final String? description;
  final bool deliveryOption;
  DetailView({
    this.deliveryOption = false,
    this.description,
  });
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          xsHeightSpan,
          Text(description ?? ""),
          sHeightSpan,
          Row(
            children: [
              Icon(Icons.delivery_dining),
              sWidthSpan,
              Text(
                "Delivery Options",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              sWidthSpan,
              Container(
                padding: sPadding,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.circular(AppDimens.CHIP_BORDER_RADIUS),
                ),
                child: deliveryOption
                    ? Text(
                        "Avalilable",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      )
                    : Text(
                        "Not Avalilable",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
