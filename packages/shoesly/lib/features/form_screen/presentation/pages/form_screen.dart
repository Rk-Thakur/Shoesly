import 'dart:io';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_bloc.dart';
import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_state.dart';
import 'package:shoesly/main.g.dart';
import 'package:shoesly_core/params/params.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final List<double> numbers = [39, 39.5, 40, 40.5, 41];
  final List<double> selectedNumbers = [];

  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageFileList = [];
  final nameController = TextEditingController();
  final _textEditingController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final brandController = TextEditingController();

  List<String> brandList = ['Nike', 'Reebok', 'Addidas'];

  final _globalKey = GlobalKey<FormState>();
  String _errorMessage = '';

  void _pickImages() async {
    try {
      final pickedFileList = await _picker.pickMultiImage();
      if (pickedFileList.isNotEmpty) {
        setState(() {
          _imageFileList.addAll(pickedFileList);
          _errorMessage = '';
        });
      } else {
        setState(() {
          _errorMessage = 'No Image Selected';
        });
      }
    } catch (e) {
      print("Image picking error: $e");
      setState(() {
        _errorMessage = 'Error Picking Images';
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFileList.removeAt(index);
    });
  }

  void _onNumberTap(double number) {
    setState(() {
      if (selectedNumbers.contains(number)) {
        selectedNumbers.remove(number);
      } else {
        selectedNumbers.add(number);
      }
      updateTextField();
    });
  }

  void updateTextField() {
    _textEditingController.text = selectedNumbers.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final formState = context.watch<FormScreenBloc>().state;
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          vertical: 30.sp,
        ),
        child: Stack(
          children: [
            BlocListener<FormScreenBloc, FormScreenState>(
              listener: (context, state) {
                if (state.formStatus == FormStatus.posted) {
                  Utilities.pushNamedAndRemoveUntil(
                    context,
                    ShoeslyRoutes.discoverScreen,
                  );
                }
              },
              child: Form(
                key: _globalKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            )),
                        width: double.infinity,
                        height: 400,
                        child: _imageFileList.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // Adjust columns as needed
                                  ),
                                  itemCount: _imageFileList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () => _removeImage(index),
                                        child: Image.file(File(_imageFileList[index].path)));
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  _errorMessage.isNotEmpty ? _errorMessage : 'No Image Selected!',
                                ),
                              ),
                      ),
                      10.verticalSpace,
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          return value!.isEmpty ? 'Enter the Product Name' : null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Product Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                      10.verticalSpace,
                      // DropdownButtonFormField<String>(
                      //     decoration: InputDecoration(
                      //         hintText: 'Brands',
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //             borderSide: const BorderSide(
                      //               color: Colors.black,
                      //               width: 0,
                      //               style: BorderStyle.solid,
                      //             ))),
                      //     validator: (value) {
                      //       return value!.isEmpty ? 'Select Brands' : null;
                      //     },
                      //     isExpanded: true,
                      //     value: _selectedBrand,
                      //     items: [
                      //       ...List.generate(
                      //         brandList.length,
                      //         (index) => DropdownMenuItem(
                      //           value: brandList[index],
                      //           child: Text(
                      //             brandList[index],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //     onChanged: (newValue) {
                      //       setState(() {
                      //         _selectedBrand = newValue!;
                      //       });
                      //     }),
                      10.verticalSpace,
                      TextFormField(
                        controller: _textEditingController,
                        readOnly: true,
                        validator: (value) {
                          return value!.isEmpty ? 'Select the size..' : null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Size',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                      10.verticalSpace,
                      SizedBox(
                        width: 260.w,
                        height: 40.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final number = numbers[index];

                            return GestureDetector(
                              onTap: () => _onNumberTap(number),
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedNumbers.contains(number)
                                        ? const Color.fromARGB(255, 237, 234, 234)
                                        : Colors.white,
                                    border: Border.all(
                                      width: 2.sp,
                                      color: selectedNumbers.contains(number)
                                          ? Colors.black
                                          : const Color(0xffE7E7E7),
                                    )),
                                child: Center(
                                  child: Text(
                                    '$number',
                                    style: TextStyle(
                                      // color: index == tappedSized ? Colors.white : const Color(0xff6F6F6F),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: .1,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 4.horizontalSpace;
                          },
                          itemCount: numbers.length,
                        ),
                      ),
                      10.verticalSpace,
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 5,
                        validator: (value) {
                          return value!.isEmpty ? 'Add the description of the product..' : null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Description',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                      10.verticalSpace,
                      TextFormField(
                        controller: priceController,
                        validator: (value) {
                          return value!.isEmpty ? 'Select the price.' : null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Price',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                      10.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          if (_globalKey.currentState!.validate() && _imageFileList.isNotEmpty) {
                            final FormParams formParams = FormParams(
                                productId: Random().nextInt(99999),
                                images: _imageFileList,
                                productName: nameController.text,
                                sizes: selectedNumbers,
                                description: descriptionController.text,
                                price: int.parse(priceController.text));

                            context
                                .read<FormScreenBloc>()
                                .add(AddProductEvent(formParams: formParams));
                          }
                        },
                        child: Container(
                          height: 54.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100.sp),
                          ),
                          child: Center(
                            child: Text(
                              "APPLY",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            formState.formStatus == FormStatus.loading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImages,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
