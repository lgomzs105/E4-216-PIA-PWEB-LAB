CREATE TABLE "restaurante" (
    "id_restaurante" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "nombre" VARCHAR(255) NOT NULL,
    "direccion" VARCHAR(255) NOT NULL,
    "ciudad" VARCHAR(100) NOT NULL,
    "estado" VARCHAR(100) NOT NULL,
    "codigo_postal" VARCHAR(20) NOT NULL
);

-- Tabla rol
CREATE TABLE "rol" (
    "id_rol" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "descripcion" VARCHAR(100) NOT NULL
);

-- Tabla empleado
CREATE TABLE "empleado" (
    "id_empleado" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "nombre" VARCHAR(100) NOT NULL,
    "apellidos" VARCHAR(100) NOT NULL,
    "correo" VARCHAR(255) NOT NULL UNIQUE,
    "telefono" VARCHAR(20) NOT NULL,
    "contrasena" VARCHAR(255) NOT NULL,
    "id_rol" INTEGER NOT NULL,
    "id_restaurante" INTEGER NOT NULL,
    CONSTRAINT "empleado_id_rol_foreign" FOREIGN KEY ("id_rol") REFERENCES "rol"("id_rol"),
    CONSTRAINT "empleado_id_restaurante_foreign" FOREIGN KEY ("id_restaurante") REFERENCES "restaurante"("id_restaurante"),
    CONSTRAINT "empleado_correo_unique" UNIQUE ("correo")
);

-- Tabla estado_reserva
CREATE TABLE "estado_reserva" (
    "id_estado" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "descripcion" VARCHAR(100) NOT NULL
);

-- Tabla reserva
CREATE TABLE "reserva" (
    "id_reserva" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "cantidad_personas" INTEGER NOT NULL,
    "fecha" DATE NOT NULL,
    "hora_inicio" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "hora_fin" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "apellido" VARCHAR(100) NOT NULL,
    "telefono" VARCHAR(20) NOT NULL,
    "ocasion" VARCHAR(255),
    "id_estado" INTEGER NOT NULL,
    "id_restaurante" INTEGER NOT NULL,
    CONSTRAINT "reserva_id_estado_foreign" FOREIGN KEY ("id_estado") REFERENCES "estado_reserva"("id_estado"),
    CONSTRAINT "reserva_id_restaurante_foreign" FOREIGN KEY ("id_restaurante") REFERENCES "restaurante"("id_restaurante")
);

-- Tabla horario_restaurante
CREATE TABLE "horario_restaurante" (
    "id_horario_restaurante" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "dia" VARCHAR(15) NOT NULL,
    "abierto" BOOLEAN NOT NULL,
    "hora_apertura" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "hora_cierre" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "capacidad" INTEGER NOT NULL,
    "id_restaurante" INTEGER NOT NULL,
    CONSTRAINT "horario_restaurante_id_restaurante_foreign" FOREIGN KEY ("id_restaurante") REFERENCES "restaurante"("id_restaurante")
);

-- Tabla menu
CREATE TABLE "menu" (
    "id_menu" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "archivo" TEXT NOT NULL,
    "id_restaurante" INTEGER NOT NULL,
    CONSTRAINT "menu_id_restaurante_foreign" FOREIGN KEY ("id_restaurante") REFERENCES "restaurante"("id_restaurante")
);