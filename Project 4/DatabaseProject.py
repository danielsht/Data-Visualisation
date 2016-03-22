#!/user/bin/python

import sqlite3

def printDB():
	conn = sqlite3.connect('/Users/danielshteremberg/Documents/SMU/Data/Data-Visualisation/Project 4/songs.sqlite3.db')
	conn.text_factory = str

	c = conn.cursor()

	for row in c.execute('SELECT songs.name, albums.name, artists.name, genres.name FROM songs INNER JOIN genres ON songs.genre_id=genres.id INNER JOIN albums ON songs.album_id=albums.id JOIN artists ON albums.artist_id=artists.id ORDER BY songs.album_id'):
		print row

	conn.close()
	
def addGenre():
	conn = sqlite3.connect('/Users/danielshteremberg/Documents/SMU/Data/Data-Visualisation/Project 4/songs.sqlite3.db')
	conn.text_factory = str

	c = conn.cursor()
	print "Genres in the database:"
	for row in c.execute('SELECT name FROM genres'):
		print row
		
	genre = raw_input('Enter New Genre: ')
	c.execute('INSERT INTO genres(name) VALUES (?)', (genre,))
	
	conn.commit()
		
	conn.close()

while True:
	
	print('Welcome To The Music Database!')
	print('\t 1. Display all song information \n \t 2. Add a new Genre \n \t 6. Exit')
	choice = input('Enter a choice: ')
	if choice == 1 :
		printDB()
	elif choice == 2 :
		addGenre()
	elif choice == 6 :
		exit()
	
	
	