# This file is to test MySQL functions out on the IMDB dataset

# Creates a database called imdb
CREATE DATABASE imdb;

# Use the imdb database
USE imdb;
/*
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
*/

# Show the tables in the imdb database
SHOW TABLES;
/*
+------------------+
| Tables_in_imdb   |
+------------------+
| actors           |
| directors        |
| directors_genres |
| movies           |
| movies_directors |
| movies_genres    |
| roles            |
+------------------+
7 rows in set (0.01 sec)
*/

# Look at the actors table
DESCRIBE actors;
/*
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int          | NO   | PRI | 0       |       |
| first_name | varchar(100) | YES  | MUL | NULL    |       |
| last_name  | varchar(100) | YES  | MUL | NULL    |       |
| gender     | char(1)      | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)
*/

# Look at the movies table
DESCRIBE movies;
/*
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   | PRI | 0       |       |
| name      | varchar(100) | YES  | MUL | NULL    |       |
| year      | int          | YES  |     | NULL    |       |
| rankscore | float        | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.02 sec)
*/

# Query first 10 movies
SELECT * FROM movies LIMIT 10;
/*
+----+-------------------------------------+------+-----------+
| id | name                                | year | rankscore |
+----+-------------------------------------+------+-----------+
|  0 | #28                                 | 2002 |      NULL |
|  1 | #7 Train: An Immigrant Journey, The | 2000 |      NULL |
|  2 | $                                   | 1971 |       6.4 |
|  3 | $1,000 Reward                       | 1913 |      NULL |
|  4 | $1,000 Reward                       | 1915 |      NULL |
|  5 | $1,000 Reward                       | 1923 |      NULL |
|  6 | $1,000,000 Duck                     | 1971 |         5 |
|  7 | $1,000,000 Reward, The              | 1920 |      NULL |
|  8 | $10,000 Under a Pillow              | 1921 |      NULL |
|  9 | $100,000                            | 1915 |      NULL |
+----+-------------------------------------+------+-----------+
10 rows in set (0.00 sec)
*/

# Query name and year of first 10 movies 
SELECT name, year FROM movies LIMIT 10;
/*
+-------------------------------------+------+
| name                                | year |
+-------------------------------------+------+
| #28                                 | 2002 |
| #7 Train: An Immigrant Journey, The | 2000 |
| $                                   | 1971 |
| $1,000 Reward                       | 1913 |
| $1,000 Reward                       | 1915 |
| $1,000 Reward                       | 1923 |
| $1,000,000 Duck                     | 1971 |
| $1,000,000 Reward, The              | 1920 |
| $10,000 Under a Pillow              | 1921 |
| $100,000                            | 1915 |
+-------------------------------------+------+
10 rows in set (0.00 sec)
*/

# Query first 10 movies offsetting by first 8
SELECT * FROM movies LIMIT 10 OFFSET 8;
/*
+----+------------------------+------+-----------+
| id | name                   | year | rankscore |
+----+------------------------+------+-----------+
|  8 | $10,000 Under a Pillow | 1921 |      NULL |
|  9 | $100,000               | 1915 |      NULL |
| 10 | $100,000 Pyramid, The  | 2001 |      NULL |
| 11 | $1000 a Touchdown      | 1939 |       6.7 |
| 12 | $20,000 Carat, The     | 1913 |      NULL |
| 13 | $21 a Day Once a Month | 1941 |      NULL |
| 14 | $2500 Bride, The       | 1912 |      NULL |
| 15 | $30                    | 1999 |       7.5 |
| 16 | $30,000                | 1920 |      NULL |
| 17 | $300 y tickets         | 2002 |      NULL |
+----+------------------------+------+-----------+
10 rows in set (0.00 sec)
*/
   
# Query name, rankscore, and year of first 10 movies ordered by descending year
SELECT name, rankscore, year FROM movies ORDER BY year DESC LIMIT 10;
/*
+-------------------------------------------+-----------+------+
| name                                      | rankscore | year |
+-------------------------------------------+-----------+------+
| Harry Potter and the Half-Blood Prince    |      NULL | 2008 |
| Tripoli                                   |      NULL | 2007 |
| War of the Red Cliff, The                 |      NULL | 2007 |
| Rapunzel Unbraided                        |      NULL | 2007 |
| Spider-Man 3                              |      NULL | 2007 |
| Untitled Star Trek Prequel                |      NULL | 2007 |
| DragonBall Z                              |      NULL | 2007 |
| Harry Potter and the Order of the Phoenix |      NULL | 2007 |
| Andrew Henry's Meadow                     |      NULL | 2006 |
| American Rain                             |      NULL | 2006 |
+-------------------------------------------+-----------+------+
10 rows in set (0.27 sec)
*/

# Query name, rankscore, and year of first 10 movies ordered by ascending year
SELECT name, rankscore, year FROM movies ORDER BY year LIMIT 10;
/*
+--------------------------------------+-----------+------+
| name                                 | rankscore | year |
+--------------------------------------+-----------+------+
| Roundhay Garden Scene                |      NULL | 1888 |
| Traffic Crossing Leeds Bridge        |      NULL | 1888 |
| Monkeyshines, No. 2                  |      NULL | 1890 |
| Monkeyshines, No. 1                  |       7.3 | 1890 |
| Monkeyshines, No. 3                  |      NULL | 1890 |
| Duncan Smoking                       |       3.6 | 1891 |
| Newark Athlete                       |       4.3 | 1891 |
| Duncan or Devonald with Muslin Cloud |       3.5 | 1891 |
| Monkey and Another, Boxing           |       3.2 | 1891 |
| Duncan and Another, Blacksmith Shop  |       3.5 | 1891 |
+--------------------------------------+-----------+------+
10 rows in set (0.15 sec)
*/

# Distinct keyword
SELECT DISTINCT(genre) FROM movies_genres;
/*
+-------------+
| genre       |
+-------------+
| Documentary |
| Short       |
| Comedy      |
| Crime       |
| Western     |
| Family      |
| Animation   |
| Drama       |
| Romance     |
| Mystery     |
| Thriller    |
| Adult       |
| Music       |
| Action      |
| Fantasy     |
| Sci-Fi      |
| Horror      |
| War         |
| Musical     |
| Adventure   |
| Film-Noir   |
+-------------+
21 rows in set (0.22 sec)
*/

SELECT DISTINCT first_name, last_name FROM directors LIMIT 10;
/*
+--------------------+-------------+
| first_name         | last_name   |
+--------------------+-------------+
| Todd               | 1           |
| Les                | 12 Poissons |
| Lejaren            | a'Hiller    |
| Nian               | A           |
| Khairiya           | A-Mansour   |
| Ricardo            | A. Solla    |
| Kodanda Rami Reddy | A.          |
| Nageswara Rao      | A.          |
| Yuri               | A.          |
| Swamy              | A.S.A.      |
+--------------------+-------------+
10 rows in set (0.00 sec)
*/

SELECT 
    name, year, rankscore 
FROM 
    movies 
WHERE 
    rankscore > 9 
ORDER BY 
    rankscore DESC 
LIMIT 20;
/*
+-----------------------------------------+------+-----------+
| name                                    | year | rankscore |
+-----------------------------------------+------+-----------+
| Huttyn                                  | 1996 |       9.9 |
| New Clear Farm                          | 1998 |       9.9 |
| Duminica la ora 6                       | 1965 |       9.9 |
| Blow Job                                | 2002 |       9.9 |
| New World, The                          | 1982 |       9.9 |
| Marche des femmes  Hendaye, La          | 1975 |       9.9 |
| Distinto amanecer                       | 1943 |       9.9 |
| Dawn of the Friend                      | 2004 |       9.9 |
| Himala                                  | 1982 |       9.9 |
| Atunci i-am condamnat pe toti la moarte | 1971 |       9.9 |
| Complex Sessions, The                   | 1994 |       9.9 |
| Clearing, The                           | 2001 |       9.9 |
| Duck Soup                               | 1942 |       9.9 |
| Gong fu qi jie                          | 1979 |       9.9 |
| Dosti                                   | 1964 |       9.9 |
| Devil's Circus, The                     | 1926 |       9.9 |
| Jnos vitz                               | 1973 |       9.9 |
| Genet parle d'Angela Davis              | 1970 |       9.9 |
| Napolon Bonaparte                       | 1934 |       9.9 |
| Ivan Groznyj III                        | 1988 |       9.9 |
+-----------------------------------------+------+-----------+
20 rows in set (0.13 sec)
*/












