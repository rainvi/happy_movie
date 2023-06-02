package dao;
import dto.ImageDTO;

public interface ImageDAOInt {
	
	// movie table에 img 링크가 생김
	// 스틸컷에만 쓰이게 되나?
	
	/*작업 종류 : 
	 * 영화 id에 해당하는 img url 중 p만 반환 - select
	 * 영화 id에 해당하는 img url 중 s만 반환 - select
	 * 영화 id에 해당하는 스틸컷의 개수 반환 - select count
	 * 영화 id에 해당하는 포스터의 개수 반환 - select count
	 * ...
	 * */
	
	public String[] selectImageP(String movie_id);
	
	public String[] selectImageS(String movie_id);
	
	public int countImageP(String movie_id);
	
	public int countImageS(String movie_id);

}
