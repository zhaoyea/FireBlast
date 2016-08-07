package model;

public class GamesGenre {
	private int GameID;
	private int GenreID;

	public GamesGenre() {
		
	}
	
	public GamesGenre(int gameID, int genreID) {
		super();
		GameID = gameID;
		GenreID = genreID;
	}

	public int getGameID() {
		return GameID;
	}

	public void setGameID(int gameID) {
		GameID = gameID;
	}

	public int getGenreID() {
		return GenreID;
	}

	public void setGenreID(int genreID) {
		GenreID = genreID;
	}

}
