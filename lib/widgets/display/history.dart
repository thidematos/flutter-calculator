import 'package:calculator/services/cloud_store_api.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CloudStoreApi.getHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          Center(
            child: CircularProgressIndicator(
              color: ColorTheme.primaryBlue,
            ),
          );
        }

        if (snapshot.hasData) {
          final user = FirebaseAuth.instance.currentUser;
          final data = (snapshot.data as List).map((item) => item.data());

          final filteredData = data.where((item) => item['user'] == user!.uid);

          print(filteredData);
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            height: 600,
            width: double.infinity,
            child: Column(
              spacing: 24,
              children: [
                Text(
                  'History',
                  style: LetterTheme.logo.copyWith(
                    color: ColorTheme.black,
                    letterSpacing: 3,
                  ),
                ),
                if (filteredData.isEmpty)
                  Column(
                    spacing: 20,
                    children: [
                      Image.asset('assets/sad-tony.png'),
                      Text(
                        'No calculations in history'.toUpperCase(),
                        style: LetterTheme.body.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                for (final item in filteredData)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    spacing: 16,
                    children: [
                      Text(
                        '${DateTime.fromMillisecondsSinceEpoch(item['timestamp']).day}/${DateTime.fromMillisecondsSinceEpoch(item['timestamp']).month.toString().padLeft(2, '0')}/${DateTime.fromMillisecondsSinceEpoch(item['timestamp']).year} - ${DateTime.fromMillisecondsSinceEpoch(item['timestamp']).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(item['timestamp']).minute.toString().padLeft(2, '0')}',
                        style: LetterTheme.body
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 4,
                          children: [
                            Text(
                              '${item['buffer'][0]} ${item['operation']} ${item['buffer'][1]} =',
                              style: LetterTheme.body,
                            ),
                            Text(
                              item['value'],
                              style: LetterTheme.body.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ],
            ),
          );
        }

        return Text('a');
      },
    );
  }
}
