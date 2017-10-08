
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
 *
 */
public class Test {

	public static void main(String[] args) throws Exception {
		String res="configuration/mybatis_conf.xml";
		SqlSessionFactory fac=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(res));
		fac.getConfiguration().addMapper(UserSql.class);
		SqlSession session=fac.openSession();
		UserSql uo=session.getMapper(UserSql.class);
		User a=uo.getUserByID("1111");
		System.out.println(a);
	}

}
