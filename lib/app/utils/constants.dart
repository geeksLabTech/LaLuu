const USERAPPLIANCEBOX = 'user_appliance_box';
const APPLIANCEBOX = 'appliance_box';
const APPLIANCESELECTEDKEY = 'appliance_selected_key';
const JSONDBDIRECTORY = 'assets/db/appliance_db.json';
const JSONDBTESTDIRECTORY = 'assets/db/db_test.json';

const NOMINALTEXT =
    "Es importante mencionar que el consumo de equipos como aires acondicionados, refrigeradores y freezers puede estar sujeto a errores, dado que se debe utilizar su consumo nominal para mejorar la pecicion del calculo, lamentablemente el consumo nominal varia en dependencia de demasiados factores, incluidos temperatura, area a enfriar etc, por tanto, se aconseja al usuario tomar con cautela las cifras de prediccion de estos equipos";

const List<double> PRICES = [
  0.33,
  1.07,
  1.43,
  2.46,
  3.0,
  4.0,
  5.0,
  6.0,
  7.0,
  9.20,
  9.45,
  9.85,
  10.8,
  11.8,
  12.9,
  13.95,
  15.0,
  20.0,
];

const List<double> CONSUMPTIONRANGES = [
  100,
  150,
  200,
  250,
  300,
  350,
  400,
  450,
  500,
  600,
  700,
  1000,
  1800,
  2600,
  3400,
  4200,
  5000,
];

const List<String> TARIFFRANGES = [
  "0-100",
  "101-150",
  "151-200",
  "201-250",
  "251-300",
  "301-350",
  "351-400",
  "401-450",
  "451-500",
  "501-600",
  "601-700",
  "701-1000",
  "1001-1800",
  "1801-2600",
  "2601-3400",
  "3401-4200",
  "4201-5000",
  "+ de 5000"
];
