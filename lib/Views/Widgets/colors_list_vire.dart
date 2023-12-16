import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Cubits/AddNote/addnote_cubit.dart';

class ColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;
  const ColorItem({super.key, required this.isActive, required this.color});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 35,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  BlocProvider.of<AddnoteCubit>(context).color = colors[index];
                });
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index].withOpacity(0.8),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Color> colors = [
  const Color(0xffFFBE86),
  const Color(0xffFFE156),
  const Color(0xffFFE9CE),
  const Color(0xffFFB5C2),
  const Color(0xff3777FF),
  const Color(0xff2A9D8F),
  const Color(0xffE76F51),
  const Color(0xffFFB703),
  const Color(0xff8ECAE6),
  const Color(0xff023047),
];
