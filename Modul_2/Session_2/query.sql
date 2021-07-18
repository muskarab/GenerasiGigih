#Buat database
CREATE DATABASE databasename;

#Hapus database
DROP DATABASE databasename;

#Buat tabel
CREATE TABLE Persons (
    PersonID int not null auto_increment,
    LastName varchar(255),
    primary key (PersonID)
);

#Hapus tabel
DROP TABLE table_name;

#Ubah tabel - Tambah kolom
ALTER TABLE table_name
ADD column_name datatype;

#Ubah tabel - Hapus kolom
ALTER TABLE table_name
DROP COLUMN column_name;

#Ubah tabel - Ubah kolom
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

#Cek detail tabel
DESCRIBE table_name;

#Primary key
ALTER TABLE Persons
ADD PRIMARY KEY (ID);

#Relasi
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

#Hapus Primary key
ALTER TABLE Persons
DROP PRIMARY KEY;

