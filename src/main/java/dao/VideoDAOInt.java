package dao;
import dto.VideoDTO;

public interface VideoDAOInt {
	/*
	 * movie_id에 맞는 video와 comment 불러오기 - select
	 * random movie_id 3개에 맞는 video와 comment 3개 불러오기 - select
	 * 추가하기? - insert
	 * 삭제하기? - delete
	 * 업데이트? - update
	 */

	public VideoDTO selectVideo(String movie_id);
	
	public VideoDTO[] selectVideoRandom(String[] movie_ids);
	
	public void insertVideo(VideoDTO vd);
	
	public void deleteVideo(String movie_id);
	
	public void updateVideo(VideoDTO vd);
}
