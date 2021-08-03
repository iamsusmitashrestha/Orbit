import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_chip.dart';
import 'package:orbit/common/widgets/k_icon_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/common/widgets/k_time_picker.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/store_details_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class StoreDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreDetailsViewModel>.reactive(
      viewModelBuilder: () => locator<StoreDetailsViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: Colors.white,
          padding: mPadding,
          child: Form(
            child: ListView(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/store-details.svg",
                  height: 200,
                  fit: BoxFit.contain,
                ),
                elHeightSpan,
                Row(
                  children: [
                    KChip(
                      text: "Store Details",
                      variant: ChipVariant.FILLED,
                      onPressed: model.setStoreDetailsPressed,
                      selected: model.isStoreDetailsPressed,
                    ),
                    mWidthSpan,
                    KChip(
                      text: "Location",
                      variant: ChipVariant.FILLED,
                      onPressed: model.setLocationPressed,
                      selected: model.isLocationPressed,
                    ),
                  ],
                ),
                lHeightSpan,
                if (model.isStoreDetailsPressed)
                  Column(
                    children: [
                      TextFormField(
                        initialValue: model.userDataService.storeName,
                        onChanged: model.onNameChanged,
                        decoration: InputDecoration(
                            labelText: 'Store Name',
                            hintText: 'Enter your store name',
                            counterText: "",
                            prefixIcon: Icon(Icons.shop)),
                      ),
                      mHeightSpan,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KTimePicker(
                            initialTime: model.userDataService.openingTime,
                            onTimePicked: model.setOpeningTime,
                            labelText: "Opening Time",
                          ),
                          KTimePicker(
                            initialTime: model.userDataService.closingTime,
                            onTimePicked: model.setClosingTime,
                            labelText: "Closing Time",
                          ),
                        ],
                      ),
                      mHeightSpan,
                      TextFormField(
                        initialValue: model.userDataService.storeDescription,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter description of your store!';
                          }
                          return null;
                        },
                        maxLines: 2,
                        maxLength: 250,
                        onChanged: model.onDescriptionChanged,
                        decoration: InputDecoration(
                            labelText: 'Short Store Description',
                            hintText: 'Enter short description of your store',
                            counterText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                      ),
                      SizedBox(height: 30),
                      CheckboxListTile(
                        onChanged: model.onDeliveryOptionChanged,
                        value: model.deliveryOption,
                        title: AnimatedContainer(
                            duration: Duration(milliseconds: 320),
                            curve: Curves.linear,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: model.deliveryOption
                                  ? PRIMARY_COLOR
                                  : Colors.pink,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Text(
                                'Do you provide home delivery ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                      lHeightSpan,
                      KButton(
                        child: Text("Save"),
                        onPressed: model.save,
                        isBusy: model.isBusy,
                      ),
                    ],
                  ),
                if (model.isLocationPressed)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: KTextFormField(
                              label: " Location",
                              controller: model.locationController,
                            ),
                          ),
                          mWidthSpan,
                          SizedBox(
                            width: 58,
                            height: 58,
                            child: Container(
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                borderRadius: AppDimens.INPUT_BORDER_RADIUS,
                              ),
                              child: KIconButton(
                                iconFill: Icons.location_on,
                                filled: true,
                                fillColor: Colors.white,
                                onPressed: model.onSelectMap,
                                size: IconButtonSize.LARGE,
                              ),
                            ),
                          ),
                        ],
                      ),
                      mHeightSpan,
                      TextFormField(
                        initialValue: model.userDataService.address,
                        onChanged: model.onAddressChanged,
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                      ),
                      mHeightSpan,
                      TextFormField(
                        initialValue: model.userDataService.hints ?? "",
                        maxLines: 3,
                        maxLength: 250,
                        onChanged: model.onHintsChanged,
                        decoration: InputDecoration(
                          labelText: 'Hints to your store location',
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      lHeightSpan,
                      KButton(
                        onPressed: model.saveLocation,
                        child: Text("Save"),
                        isBusy: model.isBusy,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
