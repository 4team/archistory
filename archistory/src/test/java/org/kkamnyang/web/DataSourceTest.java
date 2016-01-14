package org.kkamnyang.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.aop.aspectj.annotation.MetadataAwareAspectInstanceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class DataSourceTest {
	
	@Autowired
	private DataSource ds;
	//private SqlSessionFactory sqlFactory;

	@Test
	public void test() throws Exception {
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from tbl_admin");
		ResultSetMetaData rs = pstmt.getMetaData();
		
		for(int i = 0 ; i < rs.getColumnCount(); i++){
			System.out.print("private ");
			System.out.print(rs.getColumnClassName(i+1)+ " " +rs.getColumnName(i+1).toLowerCase()+";");
			System.out.println();
		}
	}

}
