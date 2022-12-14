package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.BoardBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//글의 개수 구하기
	public int selectListCount(String searchWord) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			if(searchWord == null || searchWord.length() == 0) {
				pstmt=con.prepareStatement("SELECT COUNT(*) FROM BOARD");
				rs = pstmt.executeQuery();
			}
			else if(searchWord != null) {
				pstmt=con.prepareStatement("SELECT COUNT(*) FROM BOARD WHERE BOARD_SUBJECT LIKE ? OR BOARD_CONTENT LIKE ?");
				pstmt.setString(1, "%"+searchWord+"%");
				pstmt.setString(2, "%"+searchWord+"%");
				rs = pstmt.executeQuery();
			}
			
//			System.out.println(rs.getInt(1));
			if(rs.next()) {
				listCount=rs.getInt(1);
//				System.out.println(listCount);
			}
		}catch(Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	//글 목록 보기
//	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
	public ArrayList<BoardBean> selectArticleList(int page, String searchWord) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String board_list_sql="SELECT * FROM BOARD ORDER BY BOARD_RE_REF DESC, BOARD_RE_SEQ ASC LIMIT ? OFFSET (?-1) * 10";
		
		
		
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*10; //읽기 시작할 row번호
//		System.out.println(searchWord);
		try {
			
			if(searchWord == null || searchWord.length() == 0) {
				String board_list_sql="SELECT * FROM BOARD ORDER BY BOARD_RE_REF DESC, BOARD_RE_SEQ ASC LIMIT 10 OFFSET ?";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
			}
			else if(searchWord != null) {
				String board_list_sql="SELECT * FROM BOARD WHERE board_subject LIKE ? OR board_content LIKE ? ORDER BY BOARD_RE_REF DESC, BOARD_RE_SEQ ASC LIMIT 10 OFFSET ?";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setString(1, "%"+searchWord+"%");
				pstmt.setString(2, "%"+searchWord+"%");
				pstmt.setInt(3, startrow);
			}
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				articleList.add(board);
			}
			
		}catch(Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
		
	}
	
	//글 내용 보기
	public BoardBean selectArticle(int board_num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		
		try {
			pstmt = con.prepareStatement("SELECT * FROM BOARD WHERE BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardBean = new BoardBean();
				boardBean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardBean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardBean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardBean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardBean.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				boardBean.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				boardBean.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardBean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
		}catch(Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardBean;
		
	}
	
	//글 등록
	public int insertArticle(BoardBean article) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql="";
		int insertCount=0;
		
		try {
			pstmt=con.prepareStatement("SELECT MAX(board_num) FROM BOARD");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1;
			else
				num=1;
			
			sql="INSERT INTO BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_RE_REF,"+"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+"BOARD_DATE) VALUES(?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			insertCount=pstmt.executeUpdate();
				
		}catch(Exception ex) {
			System.out.println("boardInsert 에러 : "+ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
		
	}
	
	//글 답변
	public int insertReplyArticle(BoardBean article) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="SELECT MAX(board_num) FROM BOARD";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getBOARD_RE_REF();
		int re_lev=article.getBOARD_RE_LEV();
		int re_seq=article.getBOARD_RE_SEQ();
		
		try {
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num = rs.getInt(1)+1;
			else num=1;
			sql="UPDATE BOARD SET BOARD_RE_SEQ=BOARD_RE_SEQ+1 WHERE BOARD_RE_REF=? ";
			sql+="AND BOARD_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			int updateCount=pstmt.executeUpdate();
			
			if(updateCount > 0) {
				commit(con);
			}
			
			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="INSERT INTO BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
			sql+="BOARD_READCOUNT,BOARD_DATE) VALUES(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex) {
			System.out.println("boardReply 에러 : "+ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
		
	}
	
	//글 수정
	public int updateArticle(BoardBean article) {
		
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="UPDATE BOARD SET BOARD_NAME=?, BOARD_SUBJECT=?, BOARD_CONTENT=? WHERE BOARD_NUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_NAME());
			pstmt.setString(2, article.getBOARD_SUBJECT());
			pstmt.setString(3, article.getBOARD_CONTENT());
			pstmt.setInt(4, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		}finally {
			close(pstmt);
		}
		
		return updateCount;
		
	}
	
	//글 삭제
	public int deleteArticle(int board_num) {
		
		PreparedStatement pstmt = null;
		String board_delete_sql="DELETE FROM BOARD WHERE BOARD_NUM=?";
		int deleteCount=0;
		
		try {
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("boardDelete 에러 : "+ex);
		}finally {
			close(pstmt);
		}
		
		return deleteCount;
		
	}
	
	//조회수 업데이트
	public int updateReadCount(int board_num) {
		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="UPDATE BOARD SET BOARD_READCOUNT = "+"BOARD_READCOUNT+1 WHERE BOARD_NUM = "+board_num;
		
		try {
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex) {
			System.out.println("setReadCountUpdate 에러 : "+ex);
		}
		finally {
			close(pstmt);
		}
		
		return updateCount;
		
	}
	
	//글쓴이인지 확인
	public boolean isArticleBoardWriter(int board_num,String pass) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="SELECT * FROM BOARD WHERE BOARD_NUM=?";
		boolean isWriter = false;
		
		try {
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(pass.equals(rs.getString("BOARD_PASS"))) {
				isWriter = true;
			}
		}catch(SQLException ex) {
			System.out.println("isBoardWriter 에러 : "+ex);
		}
		finally {
			close(pstmt);
		}
		
		return isWriter;
		
	}
	
}
