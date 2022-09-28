package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardListService {

	public int getListCount(String searchWord) throws Exception {
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount(searchWord);
		close(con);
		return listCount;
		
	}
	
//	public ArrayList<BoardBean> getArticleList(int page, int limit) throws Exception {
	public ArrayList<BoardBean> getArticleList(int page,String searchWord) throws Exception {
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
//		articleList = boardDAO.selectArticleList(page, limit);
		articleList = boardDAO.selectArticleList(page, searchWord);
		close(con);
		return articleList;
		
	}
	
}
