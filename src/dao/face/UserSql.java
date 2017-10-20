package dao.face;

import org.apache.ibatis.annotations.*;

import domain.User;

public interface UserSql {
	/**
	 * 获取表中email对应的行数
	 * @param email
	 * @return User类
	 */
	@Select("select count(*) from user where email=#{email}")
	public int getNumByEmail(String email);
	/**
	 * 通过ID获取用户信息
	 * @param userID
	 * @return User类
	 */
	@Select("select * from user where userID=#{userID}")
	public User getUserByID(String userID);
	
	/**
	 * 获取表中与用户ID对应的行数
	 * @param username
	 * @return 行数
	 */
	@Select("select count(*) from user where userID=#{userID}")
	public int getNumOfID(String username);
	
	/**
	 * 获取表中与指定用户名及密码对应行的数量
	 * @param userID336
	 * @param password
	 * @return 理论上应该只有0 或者 1
	 */
	@Select("select * from user where userID=#{userID} and password=#{password}")
	public User getNumOfIDAndPas(String userID, String password);
	
	/**
	 * 往user表添加一行
	 * @param user
	 */
	@Insert("Insert into user(userID,username,email,password,sex,birth_year,birth_month,birth_day,self_introduce,isAdmin,color)"
			+ "values(#{userID},#{username},#{email},#{password},#{sex},#{birth_year},#{birth_month},#{birth_day},#{self_introduce},#{isAdmin},#{color}) ")
	public void insertUser(User user);
	
	/**
	 * 修改User
	 * @param user
	 */
	@Update("update user set username=#{username}"
			+ "set email=#{email},"
			+ "set password=#{password},"
			+ "set sex=#{sex},"
			+ "set birth_year=#{birth_year},"
			+ "set birth_month=#{birth_month},"
			+ "set birth_day=#{birth_day},"
			+ "set self_introduce=#{self_introduce},"
			+ "set isAdmin=#{isAdmin},"
			+ "set color=#{color}"
			+ "where userID=#{userID}")
	public void updateUser(User user);
}
