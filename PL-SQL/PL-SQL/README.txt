PL/SQL Module 4 - MediCore Dataset

Dataset/schema:
    hospital_management

Tables used:
    patients
    doctors
    appointments
    treatments
    billing

Folders:
    Queries/  -> Oracle PL/SQL .sql files
    Output/   -> Expected output .csv files derived from the supplied dataset

Topics covered:
1. Declaring PL/SQL Variables
2. Writing Executable Statements
3. Using SQL Statements Within a PL/SQL Block
4. Control Structures
5. Composite Data Types
6. Explicit Cursors
7. Exception Handling
8. Stored Procedures and Functions

Note:
The supplied dataset is a MySQL dump, while the requested PL/SQL syntax is Oracle PL/SQL.
The .sql files therefore use Oracle PL/SQL syntax (SET SERVEROUTPUT ON, DBMS_OUTPUT,
%TYPE, %ROWTYPE, CREATE OR REPLACE PROCEDURE/FUNCTION, etc.).
The CSV outputs are calculated from the supplied MediCore dataset.
