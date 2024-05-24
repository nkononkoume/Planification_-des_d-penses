import 'package:flutter/material.dart';

import 'inte2.dart';



class Inte1 extends StatefulWidget {
  const Inte1({super.key});

  @override
  _Inte1State createState() => _Inte1State();
}

class _Inte1State extends State<Inte1> {
  String _selectedPeriodicity = 'Mois';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planification des Dépenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Entrez la date',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer une date';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Catégorie',
                hintText: 'Sélectionnez une catégorie',
              ),
              value: null,
              items: ['Loyer', 'Services Publics', 'Nourriture', 'Transports', 'Loisirs', 'Autre']
                  .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              ))
                  .toList(),
              onChanged: (value) {},
              validator: (value) {
                if (value == null) {
                  return 'Veuillez sélectionner une catégorie';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Périodicité',
                hintText: 'Sélectionnez une périodicité',
              ),
              value: _selectedPeriodicity,
              items: ['Semaine', 'Mois', 'Année']
                  .map((periodicity) => DropdownMenuItem(
                value: periodicity,
                child: Text(periodicity),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPeriodicity = value!;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Veuillez sélectionner une périodicité';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Entrez une description',
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer une description';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Montant',
                hintText: 'Entrez le montant',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un montant';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique de sauvegarde des données du formulaire
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ExpensePlannerDashboard ();
                }));
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}