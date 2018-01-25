package persistent.config;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public abstract class AbstractRepository {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			// ���̹�Ƽ�� ���� ������ Ŭ���� �н��� �������� ��ġ�� �����Ѵ�
			String resource = "persistent/config/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			sqlSessionFactory = builder.build(reader);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
