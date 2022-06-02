-- Insert data
-- Insert in table Product
insert into Product	(`Description`, `Price`, `Category`, `Status`) VALUES ('Mini', 1.60, 'Frieten', true);
insert into Product	(`Description`, `Price`, `Category`, `Status`) VALUES ('Klein', 1.80, 'Frieten', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Groot', 2.20, 'Frieten', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Maxi', 3.20, 'Frieten', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Familie', 5.40, 'Frieten', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Curryworst', 1.80, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Curryworst Speciaal', 2.70, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Cervela', 2.20, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Mexicano', 2.00, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Boulet', 2.40, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Kipknots', 1.60, 'Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Burger', 2.20, 'Vegetarische Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Mexicano', 1.80, 'Vegetarische Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Bamischijf', 1.80, 'Vegetarische Snack', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Mayonaise', 0.90, 'Koude Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Tomaten Ketchup', 0.90, 'Koude Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Curry Ketchup', 0.90, 'Koude Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Andalouse', 0.90, 'Koude Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Samourai', 0.90, 'Koude Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Huisgemaakt Stoofvleessaus', 2.20, 'Warme Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Warme Curry', 1.80, 'Warme Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Goulashsaus', 1.80, 'Warme Saus', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Chaudfontaine Plat - 50cl', 1.80, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Chaudfontaine Bruis - 50cl', 1.80, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Coca Cola - 33cl', 1.80, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Coca Cola Zero - 33cl', 1.80, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Fanta Orange - 33cl', 1.80, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Lipton Ice Tea - 33cl', 2.20, 'Frisdrank', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Jupiler - 33cl', 1.80, 'Bier', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Jupiler 0.00% - 33cl', 1.80, 'Bier', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Leffe Blond - 50cl', 3.50, 'Bier', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Duvel - 33cl', 3.50, 'Bier', true);
insert into Product (`Description`, `Price`, `Category`, `Status`) VALUES ('Vedett extra white - 33cl', 3.00, 'Bier', true);
insert into Product	(`Description`, `Price`, `Category`, `Status`) VALUES ('Gouden carolus - 33cl', 3.50, 'Bier', true);

insert into Vacation (`fromDate`, `untilDate`) VALUES ('2022-05-09', '2022-05-16');

insert into Condiment (`Description`, `Price`) VALUES ('Zout', 0);
insert into Condiment (`Description`, `Price`) VALUES ('Geen zout', 0);
insert into Condiment (`Description`, `Price`) VALUES ('Tomaten ketchup', 0);
insert into Condiment (`Description`, `Price`) VALUES ('Curry ketchup', 0);
insert into Condiment (`Description`, `Price`) VALUES ('Koud', 0);
insert into Condiment (`Description`, `Price`) VALUES ('Gebakken', 0);

insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (1,1);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (1,2);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (2,1);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (2,2);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (3,1);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (3,2);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (4,1);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (4,2);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (5,1);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (5,2);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (7,3);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (7,4);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (8,5);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (8,6);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (10,5);
insert into ProductCondiment (`ProductId`, `CondimentId`) VALUES (10,6);

insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 0);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 1);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 2);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 3);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 4);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 5);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:00:00', '10:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:15:01', '10:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:30:01', '10:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '10:45:01', '11:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:00:01', '11:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:15:01', '11:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:30:01', '11:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '11:45:01', '12:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:00:01', '12:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:15:01', '12:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:30:01', '12:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '12:45:01', '13:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:00:01', '13:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:15:01', '13:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:30:01', '13:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '13:45:01', '14:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:00:01', '14:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:15:01', '14:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:30:01', '14:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '14:45:01', '15:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:00:01', '15:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:15:01', '15:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:30:01', '15:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '15:45:01', '16:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:00:01', '16:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:15:01', '16:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:30:01', '16:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '16:45:01', '17:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:00:01', '17:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:15:01', '17:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:30:01', '17:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '17:45:01', '18:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:00:01', '18:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:15:01', '18:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:30:01', '18:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '18:45:01', '19:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:00:01', '19:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:15:01', '19:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:30:01', '19:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '19:45:01', '20:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:00:01', '20:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:15:01', '20:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:30:01', '20:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '20:45:01', '21:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:00:01', '21:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:15:01', '21:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:30:01', '21:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '21:45:01', '22:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:00:01', '22:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:15:01', '22:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:30:01', '22:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '22:45:01', '23:00:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:00:01', '23:15:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:15:01', '23:30:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:30:01', '23:45:00', 6);
insert into Timeslot (`ISACTIVE`, `SPOTAVAILABLE`, `MAXNUMBEROFORDERS`,	`ORDERSPLACED`, `FROMTIME`, `UNTIL` , `DAYOFTHEWEEK`)
VALUES (true, true, 10, 0, '23:45:01', '23:59:59', 6);