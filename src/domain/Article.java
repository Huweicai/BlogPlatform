package domain;

/**
 * 文章JavaBean
 * 
 * @author 胡炜财
 *
 */
public class Article {
	private int articlID;
	private String releaseDate;
	private String title;
	private String content;
	private int star=0;//默认点赞数为0
	public int getArticlID() {
		return articlID;
	}
	public void setArticlID(int articlID) {
		this.articlID = articlID;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
}
