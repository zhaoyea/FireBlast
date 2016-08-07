package model;

public class Genre {
	private int GenreID;
	private String Genre;

	public Genre() {
		
	}
	public Genre(int genreID, String genre) {
		super();
		GenreID = genreID;
		Genre = genre;
	}
	
	public int getGenreID() {
		return GenreID;
	}

	public void setGenreID(int genreID) {
		GenreID = genreID;
	}

	public String getGenre() {
		return Genre;
	}

	public void setGenre(String genre) {
		Genre = genre;
	}

}
