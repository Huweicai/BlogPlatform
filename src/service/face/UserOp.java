package service.face;

import domain.User;

/**
 * User Operation 
 *  有关用户复杂操作封装的接口
 * @author 胡炜财
 *
 */
public interface UserOp {
	/**
	 * 判断指定用户ID及密码能否登录
	 * @return
	 */
	public boolean canLogin(String userID, String password);
	
	/**
	 * 判断用户ID是否可用
	 * @return
	 */
	public boolean isUserIDAvailable(String userID);
	
	/**
	 * 添加新用户
	 * @return
	 */
	public void addUser(User user);
	
}
