# demo_flutter_app

## Descrizione progetto

Questa applicazione mobile sviluppata in **Flutter** si presenta:

## Schermata 1: Navigazione

contiene 3 pulsanti per accedere alle altre schermate.

## Schermata 2: Pubblicazione MQTT

consente all'utente di inviare un messaggio a un topic su 'test.mosquitto.org'.

## Schermata 3: Sottoscrizione MQTT

Permette di ricevere e visualizzare i messaggi pubblicati su un topic.

## Schermata 4: Scansione Bluetooth

Effettua la scansione dei dispositivi Bluetooth nelle vicinanze e mostra il loro nome e l'indirizzo MAC.

---

## Annotazioni

Il progetto non è completo, purtroppo ho avuto problemi con le dependencies che non mi hanno permesso di rendere l'applicazione funzionante al 100%.
Le schermate 2 e 3 non si connettono al server e la schermata 4 non ritorna la lista di dipositivi Bluetooth.
Prima applicazione utilizzando Flutter e linguaggio dart. Nonostante la mancata conoscenza sono comunque riuscito ad ottenere un'applicazione
basilare.

---

## Tecnologie Utilizzate

- Flutter (SDK per lo sviluppo mobile)
- Dart (linguaggio di programmazione)
- MQTT Client ('mqtt_cliente' package)
- Flutter Blue Plus ('flutter_blue_plus' package per la gestione del Bluetooth)
- Material Design (Per lo stile dell'interfaccia)

---

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
