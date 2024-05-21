import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

User? currentUser = FirebaseAuth.instance.currentUser;

abstract class FormDataRemoteDataSources {
  Future<Either<Failure, bool>> postProduct({required FormParams formParams});
}

class FormDataRemoteDataSourcesImpl extends FormDataRemoteDataSources {
  @override
  Future<Either<Failure, bool>> postProduct(
      {required FormParams formParams}) async {
    try {
      var imageUrls = await Future.wait(
          formParams.images.map((image) => uploadFile(image)));

      FirebaseFirestore.instance.collection('shoesly_collections').add({
        'productImage': imageUrls,
        'productName': formParams.productName,
        'productDescription': formParams.description,
        'price': formParams.price,
        'size': formParams.sizes,
        'productId': formParams.productId,
        'brand': formParams.brand,
      });

      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

Future<String> uploadFile(XFile image) async {
  final storageReference = FirebaseStorage.instance
      .ref()
      .child('${currentUser!.displayName}/${image.name}');

  await storageReference.putFile(File(image.path));
  return await storageReference.getDownloadURL();
}
