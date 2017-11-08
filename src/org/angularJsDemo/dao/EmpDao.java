package org.angularJsDemo.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.angularJsDemo.pojo.Emp;
import org.angularJsDemo.utils.DBM;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class EmpDao {

	public List<Emp> selectAll() {

		Connection conn = DBM.getConn();
		QueryRunner qr = new QueryRunner();
		List<Emp> el = null;
		String sql = "select * from emp";
		try {
			el = qr.query(conn, sql, new BeanListHandler<Emp>(Emp.class));

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return el;
	}

	public void deleteWithEid(String eid) {
		Connection conn = DBM.getConn();
		QueryRunner qr = new QueryRunner();
		String sql = "delete from emp where eid= ?";
		try {
			qr.update(conn, sql,eid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateByEid(Emp emp) {
		Connection conn = DBM.getConn();
		QueryRunner qr = new QueryRunner();
		String sql = "update emp set ename=?,sex=?,city=?,bdate=?,did=? where eid=?";
		try {
			qr.update(conn, sql, emp.getEname(),emp.getSex(),emp.getCity(),emp.getBdate(),emp.getDid(),emp.getEid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
          
		
	}

}
