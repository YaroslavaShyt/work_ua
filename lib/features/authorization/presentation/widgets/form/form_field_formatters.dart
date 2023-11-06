import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatters {
  static final dateFormatter = MaskTextInputFormatter(
      mask: '##.##.####', filter: {"#": RegExp(r'[0-9]')});

  static final phoneNumberFormatter = MaskTextInputFormatter(
      mask: '+(38) ### ### ####', filter: {"#": RegExp(r'[0-9]')});
}
