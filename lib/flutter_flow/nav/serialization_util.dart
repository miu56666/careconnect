import 'dart:convert';
import 'package:flutter/material.dart';
import '/backend/supabase/supabase.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    String? data;
    switch (paramType) {
      case ParamType.String:
        data = param;
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);
      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  return FFPlace(
    latLng: LatLng(0.0, 0.0), // Assuming default values
    name: serializedData['name'] ?? '',
    address: serializedData['address'] ?? '',
    city: serializedData['city'] ?? '',
    state: serializedData['state'] ?? '',
    country: serializedData['country'] ?? '',
    zipCode: serializedData['zipCode'] ?? '',
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  String,
  FFPlace,
  FFUploadedFile,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType, bool isList,
) {
  try {
    if (param == null) {
      return null;
    }
    switch (paramType) {
      case ParamType.String:
        return param;
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        // Add your row types here
        return null; // Return appropriate type based on data
      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
