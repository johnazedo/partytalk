import 'package:flutter/material.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/screens/search/components/search_item.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Event> events = [
      Event(id: "1", name: "Campus Party", numberParticipants: 1024),
      Event(id: "2", name: "Aula DDM", numberParticipants: 41),
      Event(id: "3", name: "Aula PAA", numberParticipants: 15),
      Event(id: "4", name: "Formatura 2021.1", numberParticipants: 126),
      Event(id: "5", name: "Python Brasil", numberParticipants: 57),
      Event(id: "6", name: "Aula EVP", numberParticipants: 23),
      Event(id: "7", name: "Reunião empresa", numberParticipants: 5),
      Event(id: "8", name: "Amigos", numberParticipants: 7),
      Event(id: "9", name: "Aula FMC2", numberParticipants: 67),
      Event(id: "10", name: "TCC da Thais", numberParticipants: 34),
      Event(id: "11", name: "Aula Cálculo II", numberParticipants: 53),
      Event(id: "12", name: "Aula Cálculo Numérico", numberParticipants: 25),
      Event(id: "13", name: "Aula Probabilidade", numberParticipants: 42),
      Event(id: "14", name: "Calouros", numberParticipants: 146),
      Event(id: "15", name: "Aniversário de Bianca", numberParticipants: 4)
    ];
    if (events.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 14 ? 10.0 : 0.0),
            child: SearchItem(event: events[index]),
          );
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
            vertical: Dimens.bottomScreenToButtonPadding),
        child: Column(
          children: const [
            Text(
              Strings.noResults,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColors.solidGray),
            )
          ],
        ),
      );
    }
  }
}
