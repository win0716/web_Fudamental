package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NoticeDao4 {
	private static NoticeDao single;

	private NoticeDao4() {
	}

	public static NoticeDao getInstance() {
	
		
		if (single == null) {
			single = new NoticeDao();

		}

	public boolean insert(NoticeDao n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;

		try {
			con = ConnLocator.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate) ");
			sql.append("VALUES(NULL,?,?,?,NOW()); ");

			pstmt = con.prepareStatement(sql.toString());
			// 바인딩 변수 세팅
			pstmt.setString(index++, n.getWriter());
			pstmt.setString(index++, n.getTitle());
			pstmt.setString(index++, n.getContent());

		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		// TODO: handle finally clause
	}

	return isSuccess;

	}

	public boolean update(NoticeDto n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;

		try {
			con = ConnLocator.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("update notice ");
			sql.append("SET n_writer = ?, n_title=?, n_content = ?, n_regdate = NOW() ");
			sql.append("WHERE n_num = ? ");

			pstmt = con.prepareStatement(sql.toString());
			// 바인딩 변수 세팅
			pstmt.setString(index++, n.getWriter());
			pstmt.setString(index++, n.getTitle());
			pstmt.setString(index++, n.getContent());

		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		// TODO: handle finally clause
	}

	return isSuccess;

	}

public boolean update(NoticeDto n) {
	boolean isSuccess = false;
	Connection con = null;
	PreparedStatement pstmt = null;
	int index = 1;
	
 try {
	 con = ConnLocator.getConnection();
	 
	 StringBuffer sql = new StringBuffer();
	 sql.append("update notice ");
	 sql.append("SET n_writer = ?, n_title=?, n_content = ?, n_regdate = NOW() ");
	 sql.append("WHERE n_num = ? ");
	 
	 pstmt = con.prepareStatement(sql.toString());
	 //바인딩 변수 세팅
	 pstmt.setString(index++, n.getWriter());
	 pstmt.setString(index++, n.getTitle());
	 pstmt.setString(index++, n.getContent());
	 
	 
	 
} catch (SQLException e) {
	// TODO: handle exception
} finally {
	try {
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	} catch (SQLException e2) {
		// TODO: handle exception
	}
}
	// TODO: handle finally clause
}

	return isSuccess;
}

}
