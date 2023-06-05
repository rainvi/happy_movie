package dao;
import dto.BookmarkDTO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BookmarkDAOInt {
	
	/* 작업 종류 : 
	 * 특정 유저의 특정 북마크 등록 - insert
	 * 특정 유저의 특정 북마크 삭제 - delete
	 * 특정 유저의 전체 북마크 보여주기 - select
	 * */
	public void insertBookmark(BookmarkDTO bd); 
	public void deleteBookmark(BookmarkDTO bd);
	public List<BookmarkDTO> selectBookmark(String user_id);

}
