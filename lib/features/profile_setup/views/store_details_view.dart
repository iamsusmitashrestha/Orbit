import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_chip.dart';
import 'package:orbit/common/widgets/k_time_picker.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/store_details_vm.dart';
import 'package:stacked/stacked.dart';

class StoreDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreDetailsViewModel>.reactive(
      viewModelBuilder: () => locator<StoreDetailsViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: Colors.white,
          padding: sPagePadding,
          child: Form(
            child: ListView(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/store-details.svg",
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                lHeightSpan,
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
                TextFormField(
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please enter store name!';
                  //   }
                  //   return null;
                  // },
                  initialValue: model.userDataService.storeName,
                  decoration: InputDecoration(
                      labelText: 'Store Name',
                      hintText: 'Enter your store name',
                      counterText: "",
                      prefixIcon: Icon(Icons.shop)),
                ),
                mHeightSpan,

                KTimePicker(
                  onTimePicked: model.setOpeningTime,
                  labelText: "Opening Time",
                ),
                mHeightSpan,
                KTimePicker(
                  onTimePicked: model.setClosingTime,
                  labelText: "Closing Time",
                ),
                mHeightSpan,
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter description of your store!';
                    }
                    return null;
                  },
                  maxLines: 3,
                  maxLength: 250,
                  decoration: InputDecoration(
                      labelText: 'Short Store Description',
                      hintText: 'Enter short description of your store',
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                lHeightSpan,
                KButton(
                  child: Text("Save"),
                  onPressed: model.save,
                ),
                SizedBox(height: 30),
                // CheckboxListTile(
                //   value: true,
                //   onChanged: (){},
                //   title: AnimatedContainer(
                //       duration: Duration(milliseconds: 320),
                //       curve: Curves.linear,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(18),

                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.3),
                //             spreadRadius: 0.8,
                //             blurRadius: 4,
                //             offset: Offset(
                //                 0, 1), // changes position of shadow
                //           ),
                //         ],
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.all(9.0),
                //         child: Text(
                //           'Do you provide home delivery ?',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w500),
                //         ),
                //       )),

                // ),

                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
