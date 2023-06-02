package dto;

public class ImageDTO {
	private int movie_id;
	private String img_url;
	private char img_type;
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public char getImg_type() {
		return img_type;
	}
	public void setImg_type(char img_type) {
		this.img_type = img_type;
	}
}
