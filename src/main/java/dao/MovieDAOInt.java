package dao;
import dto.MovieDTO;

public interface MovieDAOInt {
	/*
	 * ó�� ���� :
	 * movie_id�� ���� ���� ��ȸ - select
	 * movie_id�� ���� ���� ��ȸ(���ǻ�) - select
	 * review ���, ����, ������ ���� ��ȭ�� ���� ������Ʈ - update
	 * ���ο� movie ���? - insert
	 * Ư�� movie ����? - delete
	 */
	
	public MovieDTO selectMovie(String movie_id);
	
	public double selectMovieRating(String movie_id);

	public void updateMovieRating(String movie_id, double new_rating);
	
	public void insertMovie(MovieDTO md);
	
	public void deleteMovie(String movie_id);
}
