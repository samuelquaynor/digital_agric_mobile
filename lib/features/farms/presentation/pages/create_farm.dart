import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../../data/models/address.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../bloc/farms_bloc.dart';
import '../widgets/add_location.dart';
import '../widgets/farm_profile_image.dart';

/// Create farm page
class CreateFarm extends StatefulWidget {
  /// Constructor
  const CreateFarm({super.key});

  @override
  State<CreateFarm> createState() => _CreateFarmState();
}

class _CreateFarmState extends State<CreateFarm> {
  final bloc = sl<FarmsBloc>();

  final formKey = GlobalKey<FormState>();
  final List<String> soilTypes = [
    'Clay',
    'Sandy',
    'Loamy',
    'Silty',
    'Chalky',
    'Peaty'
  ];
  final selectedSoil = ValueNotifier<String>('');
  final farmName = ValueNotifier<String>('');
  late Address? address = Address();
  final List<CropInfo> crops = [];
  late String soiltype;
  late double farmSize;

  String profileImageUrl = '';

  late CropInfo crop;

  // Future _showCropAddDialog() {
  //   return showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             backgroundColor: Colors.white,
  //             title: const Text('Add Crop', style: TextStyle(fontSize: 16)),
  //             actions: <Widget>[
  //               TextButton(
  //                   onPressed: () {
  //                     crops.add(crop);
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: const Text('Add'))
  //             ],
  //             content: TextField(
  //                 autofocus: true,
  //                 onChanged: (text) {
  //                   setState(() {
  //                     // crop = text;
  //                   });
  //                 },
  //                 decoration: const InputDecoration(
  //                     hintText: 'Add a crop',
  //                     hintStyle:
  //                         TextStyle(color: Colors.black38, fontSize: 14)),
  //                 style: const TextStyle(color: Colors.black),
  //                 cursorColor: Colors.black));
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.green.shade900,
              icon: const Icon(Icons.arrow_back)),
          title: Text('Create Farm',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  formKey.currentState!.save();
                  final farm = FarmEntity.initial().copyWith(
                      crops: crops,
                      farmSize: farmSize,
                      soilType: soiltype,
                      avatar: profileImageUrl,
                      latitude: address?.latitude ?? 0,
                      longitude: address?.longitude ?? 0,
                      name: farmName.value);
                  await showDialog<void>(
                      context: context,
                      builder: (context) => LoadingPage(
                          errorText: bloc.createFarmBloc(farm),
                          callback: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Farm has been created successfully')));
                            Navigator.of(context).pop();
                          }));
                },
                child: const Text('Save'))),
        body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: FarmProfileImage(
                    onChange: () async {
                      final imageUrl = await bloc.changeAvatar();
                      if (imageUrl != '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('You have changed your avatar.')));
                        setState(() {
                          profileImageUrl = imageUrl!;
                        });
                      }
                    },
                    avatarUrl: profileImageUrl),
              ),
              const Text('Add Photos of the farm here.'),
              ValueListenableBuilder<String>(
                  valueListenable: farmName,
                  builder: (context, child, value) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(12),
                                  hintText: 'Farm name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onSaved: (value) {
                                farmName.value = value!;
                              },
                              validator: Validator.name,
                              keyboardType: TextInputType.name)))),
              ListTile(
                title: Text('Add Crop(s)',
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle:
                    const Text('select crops that will be grown in the farm'),
                // trailing: IconButton(
                //     onPressed: _showCropAddDialog,
                //     icon: const Icon(Icons.add_box, color: Colors.green))
              ),
              FutureBuilder<List<CropInfo?>>(
                  future: bloc.getCropInfoBloc(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LinearProgressIndicator();
                    } else {
                      return SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemBuilder: (context, index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Chip(
                                      label: Text(
                                        snapshot.data?[index]?.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green,
                                      deleteIconColor: Colors.white,
                                      deleteIcon: crops.firstWhere(
                                                  (crop) =>
                                                      crop.id ==
                                                      snapshot
                                                          .requireData[index]
                                                          ?.id,
                                                  orElse: CropInfo.initial) !=
                                              CropInfo.initial()
                                          ? const Icon(
                                              Icons.close,
                                              size: 16,
                                            )
                                          : const Icon(
                                              Icons.add,
                                              size: 16,
                                            ),
                                      onDeleted: () {
                                        if (crops.firstWhere(
                                                (crop) =>
                                                    crop.id ==
                                                    snapshot
                                                        .requireData[index]?.id,
                                                orElse: CropInfo.initial) ==
                                            CropInfo.initial()) {
                                          setState(() {
                                            crops.add(
                                                snapshot.requireData[index]!);
                                          });
                                        } else {
                                          setState(() {
                                            crops.removeWhere((crop) =>
                                                crop.id ==
                                                snapshot.data?[index]?.id);
                                          });
                                        }
                                      })),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length));
                    }
                  }),
              ListTile(
                  title: Text('Add Location',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: address?.placeName != null
                      ? Text('${address?.placeName}')
                      : const Text('Location of farm'),
                  trailing: IconButton(
                      onPressed: () async {
                        final cropResponse =
                            await showCupertinoModalPopup<Address>(
                                context: context,
                                builder: (context) => const SearchPage());
                        setState(() {
                          address = cropResponse;
                        });
                      },
                      icon: const Icon(Icons.add_box, color: Colors.green))),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Expanded(
              //               child: Padding(
              //                   padding: EdgeInsets.only(right: 10),
              //                   child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text('Soil Type',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleMedium),
              //                         TextFormField(
              //                             decoration: InputDecoration(
              //                                 contentPadding:
              //                                     const EdgeInsets.all(12),
              //                                 hintText: 'Farm name',
              //                                 border: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(10))),
              //                             onSaved: (value) {},
              //                             validator: Validator.email,
              //                             keyboardType: TextInputType.emailAddress)
              //                       ]))),
              //           Expanded(
              //               child: Padding(
              //                   padding: EdgeInsets.only(left: 10),
              //                   child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text('Soil Type',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleMedium),
              //                         TextFormField(
              //                             decoration: InputDecoration(
              //                                 contentPadding:
              //                                     const EdgeInsets.all(12),
              //                                 hintText: 'Farm name',
              //                                 border: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(10))),
              //                             onSaved: (value) {},
              //                             validator: Validator.email,
              //                             keyboardType: TextInputType.emailAddress)
              //                       ]))),
              //         ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Soil Type',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          isExpanded: true,
                                          hint: const Text('Soil',
                                              style: TextStyle(fontSize: 14)),
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45),
                                          iconSize: 30,
                                          buttonHeight: 50,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 20, right: 10),
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          onChanged: (value) {
                                            setState(() {
                                              soiltype = value.toString();
                                            });
                                          },
                                          items: soilTypes
                                              .map((item) => DropdownMenuItem<
                                                      String>(
                                                  value: item,
                                                  child: Text(item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ))))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select Soil.';
                                            }
                                            return null;
                                          })
                                    ]))),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Farm Size(Acres)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      NumberInputWithIncrementDecrement(
                                          controller: TextEditingController(),
                                          max: 1000000.0,
                                          isInt: false,
                                          fractionDigits: 3,
                                          incDecFactor: 0.001,
                                          onChanged: (value) {
                                            setState(() {
                                              farmSize = value as double;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == '') {
                                              return 'Please enter size of farm.';
                                            }
                                            return null;
                                          },
                                          scaleHeight: 0.77)
                                    ])))
                      ])),
              // Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Expanded(
              //               child: Padding(
              //                   padding: EdgeInsets.only(right: 10),
              //                   child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text('Farm Size(Acres)',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleMedium),
              //                         NumberInputWithIncrementDecrement(
              //                             controller: TextEditingController(),
              //                             min: 0,
              //                             max: 1000000,
              //                             scaleHeight: 0.8)
              //                       ]))),
              //           Expanded(
              //               child: Padding(
              //                   padding: EdgeInsets.only(left: 10),
              //                   child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text('Soil Type',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleMedium),
              //                         NumberInputWithIncrementDecrement(
              //                             controller: TextEditingController(),
              //                             min: 0,
              //                             max: 1000000,
              //                             scaleHeight: 0.8)
              //                       ])))
              //         ]))
            ]))));
  }
}
