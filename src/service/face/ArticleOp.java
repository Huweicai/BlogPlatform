package service.face;

import java.util.List;

import domain.Article;

/**
 * User Operation 
 *  有关文章复杂操作封装的接口
 * @author 胡炜财
 *
 */
public interface ArticleOp {
	/**
	 * 在指定用户ID下添加一篇新文章
	 * @param userID 用户ID
	 * @param article 要添加的文章
	 */
	public void addArticle(String userID, Article article);
	
	/**
	 * 获取指定用户ID的所有文章标题
	 * @param userID 用户ID
	 * @return 存有该用户所有文章标题的List
	 */
	public List<Article> getAllArticleTitle(String userID);
	
	/**
	 * 获取指定用户ID的所有文章
	 * @param userID 用户ID
	 * @return 存有该用户所有文章的List
	 */
	public List<String> getAllArticle(String userID);
	/**
	 * 根据文章ID删除指定用户下的一篇文章
	 * @param userID 用户ID
	 * @param articleID 文章ID
	 */
	public void deleteArticle(String userID, int articleID);
	
	/**
	 * 给文章点一颗星，文章star数+1
	 * @param articleID 文章ID
	 */
	public void star(int articleID);
}
