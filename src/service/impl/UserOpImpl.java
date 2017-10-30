package service.impl;

import java.io.IOException;

import com.sun.deploy.uitoolkit.impl.fx.ui.UITextArea;

import dao.face.UserSql;
import domain.User;
import service.face.UserOp;
import utils.GetSqlResultUtils;

public class UserOpImpl implements UserOp {
	/**
	 * 判断用户Id和密码是否正确
	 * 
	 * @throws Exception
	 */
	@Override
	public User canLogin(String userID, String password) throws Exception {
		GetSqlResultUtils getSqlResult = new GetSqlResultUtils();
		UserSql userSql = getSqlResult.getUserSql();
		return userSql.getNumOfIDAndPas(userID, password);
	}

	/**
	 * 用来处理用户名是否存在，存在返回true，不存在返回false
	 */
	@Override
	public boolean isUserIDAvailable(String userID) throws Exception {
		GetSqlResultUtils getSqlResult=new GetSqlResultUtils();
		UserSql userSql=getSqlResult.getUserSql();
		int isExist=userSql.getNumOfID(userID);
		return isExist>0?true:false;
	}

	@Override
	public void addUser(User user) throws Exception {
		GetSqlResultUtils getSqlResult = new GetSqlResultUtils();
		UserSql userSql = getSqlResult.getUserSql();
		userSql.insertUser(user);
	}

	@Override
	public boolean isUserEmailAvailable(String eamil) throws Exception {
		GetSqlResultUtils getSqlResult = new GetSqlResultUtils();
		UserSql userSql = getSqlResult.getUserSql();
		int isExist = userSql.getNumByEmail(eamil);
		return isExist > 0 ? true : false;
	}

	@Override
	public User getUserByEmail(String email) throws Exception {
		GetSqlResultUtils util = new GetSqlResultUtils();
		UserSql userql = util.getUserSql();
		return userql.getUserByEmail(email);
	}

	@Override
	public String getIDByEamil(String email) {
		String userID = null;
		try {
			userID = getUserByEmail(email).getUserID();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userID;
	}
	/**
	 * 通过用户名和邮箱判断用户是否存在
	 * @throws Exception 
	 */
	@Override
	public boolean isUserByEmailAndUsername(String username, String eamil) throws Exception {
		GetSqlResultUtils getSqlResult = new GetSqlResultUtils();
		UserSql userSql = getSqlResult.getUserSql();
		int isExist = userSql.getNumByUsernameAndEmail(username,eamil);
		System.out.println(isExist);
		return isExist > 0 ? true : false;
	}

	@Override
	public void resetPassword(String userID, String password) throws Exception  {
		UserSql userSql = GetSqlResultUtils.getUserSql();
		User u = userSql.getUserByID(userID);
		u.setPassword(password);
		userSql.updateUser(u);
	}
	public static void main(String[] args) throws Throwable {
		UserOp userOp = (UserOp) utils.Const.context.getBean("userop");
		userOp.resetPassword("0", "1234");
	}

	@Override
	public User getUserByID(String userID) {
		UserSql userSql = GetSqlResultUtils.getUserSql();
		System.out.println("读取ID:"+userID);
		return userSql.getUserByID(userID);
	}

	@Override
	public void updateUser(User user) {
		UserSql userSql = GetSqlResultUtils.getUserSql();
		userSql.updateUser(user);
		System.out.println("用户"+user.getUserID()+"信息更新成功");
	}

}
