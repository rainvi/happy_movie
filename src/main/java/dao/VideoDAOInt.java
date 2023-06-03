package dao;
import dto.VideoDTO;

public interface VideoDAOInt {
	/*
	 * movie_id�� �´� video�� comment �ҷ����� - select
	 * random movie_id 3���� �´� video�� comment 3�� �ҷ����� - select
	 * �߰��ϱ�? - insert
	 * �����ϱ�? - delete
	 * ������Ʈ? - update
	 */

	public VideoDTO selectVideo(String movie_id);
	
	public VideoDTO[] selectVideoRandom(String[] movie_ids);
	
	public void insertVideo(VideoDTO vd);
	
	public void deleteVideo(String movie_id);
	
	public void updateVideo(VideoDTO vd);
}
