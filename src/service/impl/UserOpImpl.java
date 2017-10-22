package service.impl;

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
	public String getIDByEamil(String email) throws Exception {
		String userID = getUserByEmail(email).getUserID();
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

}
