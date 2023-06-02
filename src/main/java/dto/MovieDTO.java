package dto;

public class MovieDTO {
	private int movie_id;
	private String kor_title;
	private String eng_title;
	private float rating_star;
	private String synopsis;
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getKor_title() {
		return kor_title;
	}
	public void setKor_title(String kor_title) {
		this.kor_title = kor_title;
	}
	public String getEng_title() {
		return eng_title;
	}
	public void setEng_title(String eng_title) {
		this.eng_title = eng_title;
	}
	public float getRating_star() {
		return rating_star;
	}
	public void setRating_star(float rating_star) {
		this.rating_star = rating_star;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

}
