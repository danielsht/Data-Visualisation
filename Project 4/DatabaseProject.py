#!/user/bin/env python

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

def addAlbum():
	conn = sqlite3.connect('/Users/danielshteremberg/Documents/SMU/Data/Data-Visualisation/Project 4/songs.sqlite3.db')
	conn.text_factory = str

	c = conn.cursor()
	print "Albums in the database:"
	for row in c.execute('SELECT name FROM albums'):
		print row
		
	album = raw_input('Enter New Album: ')
	
	for row in c.execute('SELECT id, name FROM artists'):
		print row
	artists = input('Select Artists: ')
	c.execute('INSERT INTO albums(name, artist_id) VALUES (?, ?)', (album, artists,))
	
	conn.commit()
		
	conn.close()
	
def addArtist():
	conn = sqlite3.connect('/Users/danielshteremberg/Documents/SMU/Data/Data-Visualisation/Project 4/songs.sqlite3.db')
	conn.text_factory = str

	c = conn.cursor()
	print "Artists in the database:"
	for row in c.execute('SELECT name FROM artists'):
		print row
		
	artist = raw_input('Enter New Artist: ')
	c.execute('INSERT INTO artists(name) VALUES (?)', (artist,))
	
	conn.commit()
		
	conn.close()
	
def addSong():
	conn = sqlite3.connect('/Users/danielshteremberg/Documents/SMU/Data/Data-Visualisation/Project 4/songs.sqlite3.db')
	conn.text_factory = str

	c = conn.cursor()
	song = raw_input('Add a new song! \n Song Name: ')
	
	print "Genres in the database:"
	for row in c.execute('SELECT id, name FROM genres'):
		print row
	genre = input('Select Genre: ')
	
	print "Albums in the database:"
	for row in c.execute('SELECT id, name FROM albums'):
		print row
	album = input('Select Album: ')

	c.execute('INSERT INTO songs(name, genre_id, album_id) VALUES (?, ?, ?)', (song, genre, album,))
	
	conn.commit()
	
	conn.close()

while True:
	
	print('Welcome To The Music Database!')
	print('\t 1. Display all song information \n \t 2. Add a new Genre \n \t 3. Add a new Album \n \t 4. Add a new Artist \n \t 5. Add a new song \n \t 6. Exit')
	choice = input('Enter a choice: ')
	if choice == 1 :
		printDB()
	elif choice == 2 :
		addGenre()
	elif choice == 3 :
		addAlbum()
	elif choice == 4 :
		addArtist()
	elif choice == 5 :
		addSong()
	elif choice == 6 :
		exit()

	
	