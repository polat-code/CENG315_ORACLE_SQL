/*

DROP TABLE hasAuthorBook;

DROP TABLE hasAuthorDC;

DROP TABLE hasAuthorMagazine;

DROP TABLE user_tel_no;

DROP TABLE Author;

DROP TABLE room;

DROP TABLE Magazine;

DROP TABLE DVD_CD;

DROP TABLE book;

DROP TABLE reserved_materials;

DROP TABLE RENT;

DROP TABLE "USER";

DROP TABLE Status;

DROP TABLE Publisher;

DROP TABLE library;

DROP TABLE role;



*/

CREATE TABLE rent(
    rent_id number(12) NOT NULL PRIMARY KEY,
    rented_item_id number(12) NOT NULL,
    user_id number(12) NOT NULL,
    rented_at date NOT NULL,
    rented_until date NOT NULL,
    delivered_at date NOT NULL,
    item_type varchar(50 char) NOT NULL

);





CREATE TABLE reserved_materials(
    reserve_id number(12) NOT NULL PRIMARY KEY,
    reserved_item_id number(12) NOT NULL,
    user_id number(12) NOT NULL,
    reserved_at date NOT NULL,
    reserved_until date,
    is_used number(1),                  /* is_used is either 0 or 1*/
    item_type varchar(25 char) NOT NULL

);



CREATE TABLE "USER"(
    user_id number(12) NOT NULL PRIMARY KEY,
    role_id number(12) NOT NULL,
    username varchar2(250 char) NOT NULL,
    password varchar2(12 char)NOT NULL,
    name varchar2(250 char) NOT NULL,
    surname varchar2(250 char) NOT NULL,
    address varchar2(500 char),
    penalty number(6)

);






CREATE TABLE book(

    book_id number(12) NOT NULL PRIMARY KEY,
    library_id number(12) NOT NULL,
    publisher_id number(12)NOT NULL,
    status_id number(12)NOT NULL,
    title varchar(250 char)NOT NULL,
    ISBN varchar(100 char)NOT NULL,
    description varchar(400 char),
    edition number(12)NOT NULL,
    publication_year date NOT NULL,
    date_added date,
    language varchar(150 char)NOT NULL,
    genre varchar(200 char)NOT NULL,
    shelf_letter varchar(15 char)NOT NULL,
    shelf_number number(12)NOT NULL,
    item_shelf_id varchar(20 char) NOT NULL
);



CREATE TABLE DVD_CD(
    DC_id number(12) NOT NULL PRIMARY KEY,
    title varchar(200 char) NOT NULL,
    library_id number(12)NOT NULL ,
    publisher_id number(12)NOT NULL,
    status_id number(12)NOT NULL,
    publication_date date NOT NULL,
    content_lengh varchar(50 char),
    date_added date,
    genre varchar(200 char)NOT NULL,
    language varchar(150 char) NOT NULL,
    shelf_letter varchar(15 char)NOT NULL,
    shelf_number number(12)NOT NULL,
    item_shelf_id varchar(20 char) NOT NULL
); 

CREATE TABLE Magazine(
    magazine_id number(12)NOT NULL PRIMARY KEY,
    title varchar(250 char)NOT NULL,
    library_id number(12)NOT NULL,
    publisher_id number(12)NOT NULL,
    status_id number(12)NOT NULL,
    description varchar(400 char),
    publication_date date NOT NULL,
    date_added date,
    genre varchar(200 char)NOT NULL,
    language varchar(150 char)NOT NULL,
    shelf_letter varchar(15 char)NOT NULL,
    shelf_number number(12)NOT NULL,
    item_shelf_id varchar(20 char)NOT NULL

);




CREATE TABLE room(
    room_id number(12) NOT NULL PRIMARY KEY,
    room_number number(12)NOT NULL,
    library_id number(12)NOT NULL,
    status_id number(12)NOT NULL,
    room_capacity number(6)NOT NULL,
    max_time_for_renting number(6)NOT NULL

);


CREATE TABLE Author(
    author_id number(12)NOT NULL PRIMARY KEY,
    name varchar(250 char)NOT NULL,
    surname varchar(250 char)NOT NULL,
    birthdate date,
    nationality varchar(150 char) NOT NULL
);


CREATE TABLE Status (
    status_id number(12)NOT NULL PRIMARY KEY,
    status_name varchar(50 char) NOT NULL  
);

CREATE TABLE Publisher(
    publisher_id number(12) NOT NULL PRIMARY KEY,
    publisher_name varchar(250 char)NOT NULL,
    publisher_adress varchar(250 char)
);


CREATE TABLE library (
    library_id number(12)NOT NULL PRIMARY KEY,
    library_name varchar(200 char)NOT NULL,
    library_address varchar(250 char) NOT NULL
);

CREATE TABLE role (
    role_id number(12) NOT NULL PRIMARY KEY,
    role_title varchar(250 char) NOT NULL
);

CREATE TABLE hasAuthorBook(
       book_id number(12) NOT NULL,
       author_id number(12) NOT NULL
);




CREATE TABLE hasAuthorDC(
    DC_id number(12)NOT NULL,
    author_id number(12)NOT NULL
);


CREATE TABLE hasAuthorMagazine(
    magazine_id number(12) NOT NULL,
    author_id number(12) NOT NULL
);



CREATE TABLE user_tel_no(
    user_id number(12)NOT NULL,
    tel_no varchar2(11 char)NOT NULL
);



ALTER TABLE user_tel_no ADD CONSTRAINT FK_Tel_User_id FOREIGN KEY (user_id) REFERENCES "USER"(user_id);

ALTER TABLE rent ADD CONSTRAINT FK_Publisher_id FOREIGN KEY (user_id) REFERENCES "USER"(user_id);

ALTER TABLE reserved_materials ADD CONSTRAINT FK_Reserved_Materials_id FOREIGN KEY (user_id) REFERENCES "USER"(user_id);

ALTER TABLE "USER" ADD CONSTRAINT FK_Role_id FOREIGN KEY (role_id) REFERENCES role(role_id);
ALTER TABLE "USER" MODIFY penalty default 0;
ALTER TABLE book ADD CONSTRAINT FK_Library_Book_id FOREIGN KEY (library_id) REFERENCES library(library_id);
ALTER TABLE book ADD CONSTRAINT FK_Publisher_Book_id FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id);
ALTER TABLE book ADD CONSTRAINT FK_Status_Book_id FOREIGN KEY (status_id) REFERENCES Status(status_id);

ALTER TABLE DVD_CD ADD CONSTRAINT FK_Library_DC_id FOREIGN KEY (library_id) REFERENCES library(library_id);
ALTER TABLE DVD_CD ADD CONSTRAINT FK_Publisher_DC_id FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id);
ALTER TABLE DVD_CD ADD CONSTRAINT FK_Status_DC_id FOREIGN KEY (status_id) REFERENCES Status(status_id);

ALTER TABLE Magazine ADD CONSTRAINT FK_Library_Mag_id FOREIGN KEY (library_id) REFERENCES library(library_id);
ALTER TABLE Magazine ADD CONSTRAINT FK_Publisher_Mag_id FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id);
ALTER TABLE Magazine ADD CONSTRAINT FK_Status_Mag_id FOREIGN KEY (status_id) REFERENCES Status(status_id);

ALTER TABLE room ADD CONSTRAINT FK_Library_Room_id FOREIGN KEY (library_id) REFERENCES library(library_id);
ALTER TABLE room ADD CONSTRAINT FK_Status_Room_id FOREIGN KEY (status_id) REFERENCES Status(status_id);

ALTER TABLE hasAuthorBook ADD CONSTRAINT FK_Aut_Book__id FOREIGN KEY (book_id) REFERENCES book(book_id);
ALTER TABLE hasAuthorBook ADD CONSTRAINT FK_Aut_Author_id FOREIGN KEY (author_id) REFERENCES Author(author_id);



ALTER TABLE hasAuthorDC ADD CONSTRAINT FK_DC_DC_id FOREIGN KEY (DC_id) REFERENCES DVD_CD(DC_id);
ALTER TABLE hasAuthorDC ADD CONSTRAINT FK_DC_Author_id FOREIGN KEY (author_id) REFERENCES Author(author_id);


ALTER TABLE hasAuthorMagazine ADD CONSTRAINT FK_Mag_Author_id FOREIGN KEY (magazine_id) REFERENCES Magazine(magazine_id);
ALTER TABLE hasAuthorMagazine ADD CONSTRAINT FK_Mag_Magazine_id FOREIGN KEY (author_id) REFERENCES Author(author_id);
