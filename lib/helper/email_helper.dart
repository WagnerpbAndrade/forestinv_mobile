import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class EmailHelper {
  sendMailAndAttachment(final String filePath) async {
    final Email email = Email(
      body: 'Olá, segue os dos exportados em csv.',
      subject: 'Dados exportados em ${DateTime.now().formattedDate()}',
      isHTML: true,
      attachmentPaths: [filePath],
    );

    await FlutterEmailSender.send(email);
  }
}
