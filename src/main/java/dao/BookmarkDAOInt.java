package dao;
import dto.BookmarkDTO;

public interface BookmarkDAOInt {
	
	/* �۾� ���� : 
	 * Ư�� ������ Ư�� �ϸ�ũ ��� - insert
	 * Ư�� ������ Ư�� �ϸ�ũ ���� - delete
	 * Ư�� ������ ��ü �ϸ�ũ �����ֱ� - select
	 * */
	public void insertBookmark(BookmarkDTO bd); 
	public void deleteBookmark(BookmarkDTO bd);
	public BookmarkDTO[] selectBookmark(String user_id);

}
