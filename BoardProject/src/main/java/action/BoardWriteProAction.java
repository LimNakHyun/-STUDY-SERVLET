package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		BoardBean boardBean = null;
		boardBean = new BoardBean();
		boardBean.setBOARD_NAME(request.getParameter("BOARD_NAME"));
		boardBean.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		boardBean.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		boardBean.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
		if(!isWriteSuccess) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
			
//			out.println("<script>alert('등록실패'); location.href='history.back()';</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo");
		}
		
		return forward;
		
	}

}
