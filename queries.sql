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