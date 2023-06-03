package dao;
import dto.ImageDTO;

public interface ImageDAOInt {
	
	// movie table�� img ��ũ�� ����
	// ��ƿ�ƿ��� ���̰� �ǳ�?
	
	/*�۾� ���� : 
	 * ��ȭ id�� �ش��ϴ� img url �� p�� ��ȯ - select
	 * ��ȭ id�� �ش��ϴ� img url �� s�� ��ȯ - select
	 * ��ȭ id�� �ش��ϴ� ��ƿ���� ���� ��ȯ - select count
	 * ��ȭ id�� �ش��ϴ� �������� ���� ��ȯ - select count
	 * ...
	 * */
	
	public String[] selectImageP(String movie_id);
	
	public String[] selectImageS(String movie_id);
	
	public int countImageP(String movie_id);
	
	public int countImageS(String movie_id);

}
