INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES('Agumon','2020-02-03',0,true,10.23),('Gabumon','2018-11-15',2,true,8),('Pikachu','2021-01-07',1,false,15.04),('Devimon','2017-05-12',5,true,11);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),('Squirtle.','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-10-13',3,true,17),('Ditto','2022-05-14',4,true,22);
INSERT INTO owners(full_name,age)VALUES('Sam Smith ',34),('Jennifer Orwell ',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),
('Jodie Whittaker ',38);
INSERT INTO species(name)VALUES('Pokemon'),('Digimon');
UPDATE animals  SET species_id=(SELECT species.id FROM species  WHERE species.name='Digimon') WHERE name LIKE'%mon';
UPDATE animals  SET species_id=(SELECT species.id FROM species  WHERE species.name='Pokemon') WHERE name NOT LIKE'%mon';
UPDATE animals  SET owner_id=(SELECT owners.id FROM owners  WHERE owners.full_name='Sam Smith ') WHERE name='Agumon';
UPDATE animals  SET owner_id=(SELECT owners.id FROM owners  WHERE owners.full_name='Jennifer Orwell ') WHERE name IN('Gabumon','Pikachu');
UPDATE animals  SET owner_id=(SELECT owners.id FROM owners  WHERE owners.full_name='Bob') WHERE name IN('Devimon','Plantmon');
UPDATE animals  SET owner_id=(SELECT owners.id FROM owners  WHERE owners.full_name='Melody Pond') WHERE name IN('Squirtle.');
INSERT INTO vets(name,age,date_of_graduation)VALUES('William Tatcher',45,'2000-04-23'),('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),('Jack Harkness',38,'2008-06-08');
INSERT INTO specializations(specie_id,vets_id)VALUES((SELECT id FROM species WHERE name='Pokemon'),
													(SELECT id FROM vets WHERE name='William Tatcher'))
INSERT INTO specializations(specie_id,vets_id)VALUES((SELECT id FROM species WHERE name='Pokemon'),
													(SELECT id FROM vets WHERE name='Stephanie Mendez'))
INSERT INTO specializations(specie_id,vets_id)VALUES((SELECT id FROM species WHERE name='Digimon'),
													(SELECT id FROM vets WHERE name='Stephanie Mendez'))
INSERT INTO specializations(specie_id,vets_id)VALUES((SELECT id FROM species WHERE name='Digimon'),
													(SELECT id FROM vets WHERE name='Jack Harkness'))

                                                    
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Agumon'),
														(SELECT id FROM vets WHERE name='William Tatcher'),
														'2020-05-24');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Agumon'),
														(SELECT id FROM vets WHERE name='Stephanie Mendez'),
														'2020-07-22');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Gabumon'),
														(SELECT id FROM vets WHERE name='Jack Harkness'),
														'2021-02-02');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Pikachu'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2020-01-05');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Pikachu'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2020-03-08');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES((SELECT id FROM animals WHERE name='Pikachu'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2020-05-14'),
									                    ((SELECT id FROM animals WHERE name='Devimon'),
														(SELECT id FROM vets WHERE name='Stephanie Mendez'),
														'2021-05-14'),
														((SELECT id FROM animals WHERE name='Charmander'),
														(SELECT id FROM vets WHERE name='Jack Harkness'),
														'2021-02-24'),
														((SELECT id FROM animals WHERE name='Plantmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2019-12-21'),
														((SELECT id FROM animals WHERE name='Plantmon'),
														(SELECT id FROM vets WHERE name='William Tatcher'),
														'2020-08-10'),
														((SELECT id FROM animals WHERE name='Plantmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2021-04-07'),
														((SELECT id FROM animals WHERE name='Squirtle'),
														(SELECT id FROM vets WHERE name='Stephanie Mendez'),
														'2019-09-29'),
														((SELECT id FROM animals WHERE name='Angemon'),
														(SELECT id FROM vets WHERE name='Jack Harkness'),
														'2020-10-03'),
														((SELECT id FROM animals WHERE name='Angemon'),
														(SELECT id FROM vets WHERE name='Jack Harkness'),
														'2020-11-04'),
														((SELECT id FROM animals WHERE name='Boarmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2019-01-24'),
														((SELECT id FROM animals WHERE name='Boarmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2019-05-15'),
														((SELECT id FROM animals WHERE name='Boarmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2020-02-27'),
														((SELECT id FROM animals WHERE name='Boarmon'),
														(SELECT id FROM vets WHERE name='Maisy Smith'),
														'2020-08-03'),
														((SELECT id FROM animals WHERE name='Blossom'),
														(SELECT id FROM vets WHERE name='Stephanie Mendez'),
														'2020-05-24'),
														((SELECT id FROM animals WHERE name='Blossom'),
														(SELECT id FROM vets WHERE name='William Tatcher'),
														'2021-01-11');
														
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
