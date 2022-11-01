import 'package:flutter/material.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
      child: ListView(
        shrinkWrap: true,
        children: const [
          Text(
            'Substainable Agriculture Research and Education , http//www.sare.org',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 20),
          Text(
            "Jacoby, R., Peukert, M., Succurro, A., Koprivova, A. and Kopriva, S. 2017. The role of soil microorganisms in plant mineral nutrition- Current knowledge and future directions, Front. Plant Sci., 19 September 2017, https://doi.org/10.3389/fpls.2017.01617.",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
