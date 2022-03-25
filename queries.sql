SELECT * FROM animals WHERE name LIKE '%mON';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name='AgumON' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name!='GabumON';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;
SELECT species,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN'1990-01-01' AND '2000-12-31' GROUP BY species;
SELECT name,owner_id,full_name FROM animals JOIN owners ON animals.owner_id= owners.id WHERE full_name='Melody PONd';
SELECT animals.name,species.name FROM animals JOIN species ON animals.species_id= species.id WHERE species.name='PokemON';
SELECT full_name,name FROM owners LEFT JOIN animals  ON  animals.owner_id= owners.id;
SELECT species.name ,COUNT(animals.species_id) FROM animals  JOIN species  ON  animals.species_id= species.id GROUP BY species.name;

SELECT COUNT(species.id),owners.full_name FROM animals join owners ON animals.owner_id = owners.id join species ON animals.species_id = species.id where species.name='DigimON' and owners.full_name='Jennifer Orwell 'GROUP BY species.name;
SELECT animals.name FROM animals join owners ON animals.owner_id=owners.id where owners.full_name='  Dean Winchester' and animals.escape_attempts=0;
SELECT full_name,COUNT(full_name) FROM animals JOIN owners ON animals.owner_id=owners.id GROUP BY full_name ;
select   vets.name,animals.name,visits.date_of_visit from animals join visits on animals.id=visits.animal_id  join vets on vets.id=visits.vet_id  WHERE vets.name='William Tatcher' order by visits.date_of_visit desc limit 1  
select vets.name,count(visits.animal_id) as animals_visited from visits join vets on vets.id=visits.vet_id where vets.name='Stephanie Mendez' group by vets.name 
select vets.name,species.name from vets left join specializations on vets.id=specializations.vets_id left join species on species.id=specializations.specie_id
select animals.name as animal ,visits.date_of_visit ,vets.name as veterinary from animals join visits on animals.id=visits.animal_id join vets on vets.id=visits.vet_id where vets.name='Stephanie Mendez' and visits.date_of_visit between'2020-04-01' and '2020-08-30'
select animals.name,sum(visits.animal_id) as number_of_visits from animals join visits on animals.id=visits.animal_id group by animals.name order by number_of_visits desc limit 1 
select vets.name,animals.name as first_visit,visits.date_of_visit from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id where vets.name='Maisy Smith' order by visits.date_of_visit asc limit 1
select animals.name as animal,vets.name as veterinary,visits.date_of_visit from animals join visits on animals.id=visits.animal_id join vets on vets.id=visits.vet_id order by visits.date_of_visit desc limit 1
select vets.name as veterinary , sum(visits.animal_id) as visits from vets join visits on vets.id=visits.vet_id join specializations on 
specializations.vets_id=visits.vet_id join animals on animals.id=visits.animal_id  where specializations.specie_id!=animals.species_id
group by vets.name 
select species.name as speciality,sum(visits.animal_id) from visits join animals on animals.id=visits.animal_id join specializations on animals.species_id=
specializations.specie_id join species on species.id=specializations.specie_id join vets on vets.id=visits.vet_id where vets.name='Maisy Smith' group by speciality order by speciality limit 1
