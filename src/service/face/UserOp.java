package service.face;

import domain.*;

/**
 * User Operation 
 *  有关用户复杂操作封装的接口
 * @author 胡炜财
 *
 */
public interface UserOp {
	/**
	 * 判断指定用户ID及密码是否正确
	 * @return
	 * @throws Exception 
	 */
	public User canLogin(String userID, String password) throws Exception;
	/**
	 * 判断用户Email是否已经存在
	 * @param eamil
	 * @return
	 * @throws Exception 
	 */
	public boolean isUserEmailAvailable(String eamil) throws Exception;
	
	/**
	 * 判断用户ID是否可用
	 * @return
	 * @throws Exception 
	 */
	public boolean isUserIDAvailable(String userID) throws Exception;
	
	/**
	 * 添加新用户
	 * @return
	 * @throws Exception 
	 */
	public void addUser(User user) throws Exception;
	
	/**
	 * 通过邮箱获取User实体
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public User getUserByEmail(String email) throws Exception;
	
	/**
	 * 通过邮箱获取ID
	 * @param eamil
	 * @return
	 * @throws Exception
	 */
	public String getIDByEamil(String eamil) throws Exception;
	/**
	 * 通过用户名和邮箱查找用户是否存在
	 * @param username
	 * @param eamil
	 * @return
	 * @throws Exception 
	 */
	public boolean isUserByEmailAndUsername(String username, String eamil) throws Exception;
	
	
	public void resetPassword(String userID ,String password) throws Throwable;
	
	public User getUserByID(String userID);
	
	public void updateUser(User user);
}
