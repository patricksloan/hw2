# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Studio.destroy_all
Role.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Adding studios to Studios table
studio = Studio.new
studio["studio_name"] = "Warner Bros."
studio.save

# Adding actors to Actor table
actor_names = [
  "Christian Bale",
  "Michael Caine",
  "Liam Neeson",
  "Katie Holmes",
  "Gary Oldman",
  "Heath Ledger",
  "Aaron Eckhart",
  "Maggie Gyllenhaal",
  "Tom Hardy",
  "Joseph Gordon-Levitt",
  "Anne Hathaway"
]

for name in actor_names
  actor = Actor.new
  actor["actor_name"] = name
  actor.save
end

# Query to find the studio row in the Studios table
warner_bros = Studio.find_by({ "studio_name" => "Warner Bros." })

# Adding movies to the Movies table
movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

# lol recognize it would have been more efficient to add movies via loop method

# Query movie rows from the Movies table
batman_begins = Movie.find_by({ "title" => "Batman Begins" })
dark_knight = Movie.find_by({ "title" => "The Dark Knight" })
dark_knight_rises = Movie.find_by({ "title" => "The Dark Knight Rises" })

# Query actor rows from the Actors table
actors = {
  "Christian Bale" => Actor.find_by({ "actor_name" => "Christian Bale" }),
  "Michael Caine" => Actor.find_by({ "actor_name" => "Michael Caine" }),
  "Liam Neeson" => Actor.find_by({ "actor_name" => "Liam Neeson" }),
  "Katie Holmes" => Actor.find_by({ "actor_name" => "Katie Holmes" }),
  "Gary Oldman" => Actor.find_by({ "actor_name" => "Gary Oldman" }),
  "Heath Ledger" => Actor.find_by({ "actor_name" => "Heath Ledger" }),
  "Aaron Eckhart" => Actor.find_by({ "actor_name" => "Aaron Eckhart" }),
  "Maggie Gyllenhaal" => Actor.find_by({ "actor_name" => "Maggie Gyllenhaal" }),
  "Tom Hardy" => Actor.find_by({ "actor_name" => "Tom Hardy" }),
  "Joseph Gordon-Levitt" => Actor.find_by({ "actor_name" => "Joseph Gordon-Levitt" }),
  "Anne Hathaway" => Actor.find_by({ "actor_name" => "Anne Hathaway" })
}

# List of roles with corresponding movie and actor
roles = [
  { movie: batman_begins, actor: "Christian Bale", role_name: "Bruce Wayne" },
  { movie: batman_begins, actor: "Michael Caine", role_name: "Alfred" },
  { movie: batman_begins, actor: "Liam Neeson", role_name: "Ra's Al Ghul" },
  { movie: batman_begins, actor: "Katie Holmes", role_name: "Rachel Dawes" },
  { movie: batman_begins, actor: "Gary Oldman", role_name: "Commissioner Gordon" },
  { movie: dark_knight, actor: "Christian Bale", role_name: "Bruce Wayne" },
  { movie: dark_knight, actor: "Heath Ledger", role_name: "Joker" },
  { movie: dark_knight, actor: "Aaron Eckhart", role_name: "Harvey Dent" },
  { movie: dark_knight, actor: "Michael Caine", role_name: "Alfred" },
  { movie: dark_knight, actor: "Maggie Gyllenhaal", role_name: "Rachel Dawes" },
  { movie: dark_knight_rises, actor: "Christian Bale", role_name: "Bruce Wayne" },
  { movie: dark_knight_rises, actor: "Gary Oldman", role_name: "Commissioner Gordon" },
  { movie: dark_knight_rises, actor: "Tom Hardy", role_name: "Bane" },
  { movie: dark_knight_rises, actor: "Joseph Gordon-Levitt", role_name: "John Blake" },
  { movie: dark_knight_rises, actor: "Anne Hathaway", role_name: "Selina Kyle" }
]

# Loop through and create Role entries
for role_data in roles
  role = Role.new
  role["role_name"] = role_data[:role_name]
  role["actor_id"] = actors[role_data[:actor]]["id"]
  role["movie_id"] = role_data[:movie]["id"]
  role.save
end

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all
for movie in movies
  # Query to find the studio related to the movie
  studio = Studio.find_by({ "id" => movie["studio_id"] })
    # Print movie details
    puts "#{movie["title"]} #{movie["year_released"]} #{movie["mpaa_rating"]} #{studio["studio_name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Loop through all movies
for movie in movies
    # Query to find all roles related to this movie
    roles = Role.where({ "movie_id" => movie["id"] })
    
    # Loop through each role and find the corresponding actor
    for role in roles
      actor = Actor.find_by({ "id" => role["actor_id"] })
      
      # Print role details
      puts "#{movie["title"]} #{actor["actor_name"]} #{role["role_name"]}"
    end
  end