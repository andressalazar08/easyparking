BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Cliente" (
	"Cliente_id"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Cedula"	INTEGER NOT NULL,
	PRIMARY KEY("Cliente_id")
);
CREATE TABLE IF NOT EXISTS "Transaccion" (
	"Transaccion_id"	INTEGER NOT NULL,
	"Monto_total"	NUMERIC NOT NULL,
	"Impuestos"	NUMERIC NOT NULL,
	"Medio_de_pago"	TEXT NOT NULL,
	"Dinero_ingresado"	NUMERIC NOT NULL,
	"Cambio"	NUMERIC NOT NULL,
	PRIMARY KEY("Transaccion_id")
);
CREATE TABLE IF NOT EXISTS "Puestos" (
	"Id_puesto_asignado"	INTEGER NOT NULL,
	"Disponibilidad"	TEXT NOT NULL,
	"Nombre"	TEXT NOT NULL,
	PRIMARY KEY("Id_puesto_asignado")
);
CREATE TABLE IF NOT EXISTS "Vehiculo" (
	"Vehiculo_id"	INTEGER NOT NULL,
	"Fecha_de_Ingreso"	INTEGER NOT NULL,
	"Hora_de _Ingreso"	INTEGER NOT NULL,
	"Fecha_de_Salida"	INTEGER NOT NULL,
	"Placa"	TEXT NOT NULL,
	"Tipo_de_vehiculo"	TEXT NOT NULL,
	"Id_puesto_asignado"	INTEGER NOT NULL,
	"Horas_de_salida"	INTEGER NOT NULL,
	PRIMARY KEY("Vehiculo_id"),
	FOREIGN KEY("Id_puesto_asignado") REFERENCES "Puestos"("Id_puesto_asignado")
);
INSERT INTO "Cliente" VALUES (1,'Jose',12345);
INSERT INTO "Cliente" VALUES (2,'Diana',23139);
COMMIT;
