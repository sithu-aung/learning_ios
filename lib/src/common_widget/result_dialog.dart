import 'package:flutter/material.dart';

failResultDialog({
  required BuildContext context,
  Function? onTap,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 250,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Try Again'),
            InkWell(
              onTap: () {
                onTap?.call();
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                alignment: Alignment.center,
                width: 100,
                height: 40,
                child: const Text(
                  'Try Again',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

passShowDialog({
  required BuildContext context,
  Function? onTap,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 250,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.check,
              color: Colors.white,
              size: 50,
            ),
              Text('Correct Your Answer'),
          ],
        ),
      ),
    ),
  );
}
