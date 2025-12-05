import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';

class EventCard extends ConsumerStatefulWidget {
  const EventCard({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventCardState();
}

class _EventCardState extends ConsumerState<EventCard> {
  @override
  Widget build(BuildContext context) {
    const double width = 190;
    const double height = 160;
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.green,
            // ),
            color: Colors.green.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/ad2.jpg',
                  fit: BoxFit.cover,
                  height: 115,
                  // color: Colors.black.withOpacity(0.4),
                  // colorBlendMode: BlendMode.darken,
                  width: width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'App Dev Course',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
