import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/presentation/screens/more_page.dart';
import 'package:jusitfi_admin/presentation/widgets/show_sub_cat.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(
      {super.key,
      required this.image,
      required this.name,
      required this.subCatItems,
      this.is_more = false,
      this.is_interactive = true,
      this.isDark = false,
      this.isTransparentBackground = true});
  final String image;
  final String name;
  final bool isTransparentBackground;
  final bool isDark;
  final bool is_more;
  final bool is_interactive;
  final List<dynamic> subCatItems;

  /*final List<String> subCatItems = [
    'Family and Adoption',
    'Marriage dissolution',
    'Paternity and child custody',
    'Domestic Violence',
    'Name Changes',
    'Guardianship',
    'Termination of Parental Rights and Adoptions',
    'Juvenile matters',
    'Other'
  ];*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        is_interactive
            ? is_more
                ? Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const MorePage();
                  }))
                : ShowSubCat(context, subCatItems)
            : null;
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isTransparentBackground ? null : Colors.black,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(
              height: 60,
              width: 60,
              image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.openSans(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
