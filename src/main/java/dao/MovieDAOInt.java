package dao;
import dto.MovieDTO;

public interface MovieDAOInt {
	/*
	 * 처리 종류 :
	 * movie_id에 따른 정보 조회 - select
	 * movie_id에 따른 평점 조회(편의상) - select
	 * review 등록, 수정, 삭제에 따라 변화한 평점 업데이트 - update
	 * 새로운 movie 등록? - insert
	 * 특정 movie 삭제? - delete
	 */
	
	public MovieDTO selectMovie(String movie_id);
	
	public double selectMovieRating(String movie_id);

	public void updateMovieRating(String movie_id, double new_rating);
	
	public void insertMovie(MovieDTO md);
	
	public void deleteMovie(String movie_id);
}
