package com.bit.groupware.persistent.authority;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private DataSource dataSource;

	public EmployeeVO selectUserById(String id) throws Exception {
		EmployeeVO user = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select emp_no, emp_name, emp_pwd             ");
			sql.append("from employee					          			  ");
			sql.append("where emp_no=?        			                  ");
			pstmt = conn.prepareStatement(sql.toString());
					
			System.out.println(sql.toString());
			System.out.println("id : " + id);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new EmployeeVO();
				user.setEmpNo(rs.getString(1));
				user.setEmpName(rs.getString(2));
				user.setEmpPwd(rs.getString(3));
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return user;
	}

	public List<String> selectAutorities(String id) throws Exception {
		List<String> authorities = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select t3.a_name  			         			           ");
			sql.append("from authority_employee t1, employee t2, authority t3      ");
			sql.append("where t1.emp_no = t2.emp_no									");
			sql.append("and t1.a_no = t3.a_no										");
			sql.append("and t1.emp_no = ?											");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				authorities.add(rs.getString(1));
			}

		} finally {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return authorities;
	}

}
