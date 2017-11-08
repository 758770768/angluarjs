package org.angularJsDemo.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.angularJsDemo.pojo.Dept;
import org.angularJsDemo.utils.DBM;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class deptDao {
	Connection conn = DBM.getConn();
	QueryRunner qr = new QueryRunner();

	public List<Dept> selectAll() {

		String sql = "select * from dept";
		List<Dept> dl = null;
		try {
			dl = qr.query(conn, sql, new BeanListHandler<Dept>(Dept.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dl;
	}

}
