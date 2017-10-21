package service.impl;

import dao.face.UserSql;
import domain.User;
import service.face.UserOp;
import utils.GetSqlResultUtils;

public class UserServiceImpl implements UserOp {
	/**
	 * 判断用户Id和密码是否正确
	 * @throws Exception 
	 */
	@Override
	public User canLogin(String userID, String password) throws Exception {
		GetSqlResultUtils getSqlResult=new GetSqlResultUtils();
		UserSql userSql=getSqlResult.getUserSql();
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
	/**
	 * 添加用户
	 * @throws Exception 
	 */
	@Override
	public void addUser(User user) throws Exception {
		GetSqlResultUtils getSqlResult=new GetSqlResultUtils();
		UserSql userSql=getSqlResult.getUserSql();
		userSql.insertUser(user);
	}
	/**
	 * 判断用户邮箱是否存在
	 */
	@Override
	public boolean isUserEmailAvailable(String eamil) throws Exception {
		GetSqlResultUtils getSqlResult=new GetSqlResultUtils();
		UserSql userSql=getSqlResult.getUserSql();
		int isExist=userSql.getNumByEmail(eamil);
		return isExist>0?true:false;
	}

}
