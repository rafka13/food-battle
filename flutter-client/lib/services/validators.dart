import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:flutter/material.dart';

class Validator {
  final BuildContext _context;
  Validator._(this._context);

  static Validator of(BuildContext context) {
    return Validator._(context);
  }

  String? isEthereum(String? value) {
    if (value != null && isValidEthereumAddress(value)) {
      return null;
    }
    if (value!.isEmpty) return 'Empty Field';
    return 'Address is not valid';
  }
}
