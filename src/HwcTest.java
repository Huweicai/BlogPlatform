import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dao.face.UserSql;
import domain.User;

/**
 * 临时Test类用于提供简单的单元测试功能
 * 可以运行一个小模块的代码判断正确性
 * @author 胡炜财
 */
public class HwcTest {

	public static void main(String[] args) throws IOException {
		String res="configuration/mybatis_conf.xml";
		SqlSessionFactory fac=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(res));
		fac.getConfiguration().addMapper(UserSql.class);
		//自动提交
		SqlSession session = fac.openSession(true);
		UserSql uo = session.getMapper(UserSql.class);
		User u = new User();
		u.setUserID("0");
		u.setUsername("我自横刀向天笑");
		u.setPassword("123");
		u.setEmail("1792663772@qq.com");
		uo.insertUser(u);
		System.out.println(uo.getUserByID("0"));
		System.out.println();
		//再提交完之后不要忘了commit
//		session.commit();
	}

}
