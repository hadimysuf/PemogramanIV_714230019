import 'package:flutter/material.dart';
import 'user.dart';

class UserCard extends StatelessWidget {
  final UserCreate usrCreate;

  const UserCard({super.key, required this.usrCreate});

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = usrCreate.updatedAt != null;

    return Container(
      padding: const EdgeInsets.all(15),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isUpdate ? Colors.orange[200] : Colors.lightBlue[200],
      ),
      child: Column(
        children: [
          if (!isUpdate)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    'ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 220, child: Text(': ${usrCreate.id}')),
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 220, child: Text(': ${usrCreate.name}')),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                child: Text(
                  'Job',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 220, child: Text(': ${usrCreate.job}')),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  isUpdate ? 'Updated At' : 'Created At',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  ': ${isUpdate ? usrCreate.updatedAt : usrCreate.createdAt}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
