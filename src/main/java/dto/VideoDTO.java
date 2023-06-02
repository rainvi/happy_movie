package dto;

public class VideoDTO {
	private int movie_id;
	private String video_url;
	private String comment;
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
