package dao;
import dto.BookmarkDTO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BookmarkDAOInt {
	
	/* �۾� ���� : 
	 * Ư�� ������ Ư�� �ϸ�ũ ��� - insert
	 * Ư�� ������ Ư�� �ϸ�ũ ���� - delete
	 * Ư�� ������ ��ü �ϸ�ũ �����ֱ� - select
	 * */
	public void insertBookmark(BookmarkDTO bd); 
	public void deleteBookmark(BookmarkDTO bd);
	public List<BookmarkDTO> selectBookmark(String user_id);

}
