/*package notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LocationSearchServlet")
public class LocationSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String LOCATION = request.getParameter("LOCATION");
		response.getWriter().write(getJSON(LOCATION));
	}

	public String getJSON(String LOCATION) {
		if(LOCATION == null) LOCATION = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		LocationDAO locationDAO = new LocationDAO();
		ArrayList<Location> locationList = locationDAO.search(LOCATION);
		for(int i = 0; i <locationList.size(); i++) {
			result.append("[{\"value\": \"" + locationList.get(i).getLOCATION() + "\"},");
			result.append("{\"value\": \"" + locationList.get(i).getTNAME() + "\"}],");
			/*result.append("{\"value\": \"" + locationList.get(i).getLOCATION() + "\"},");
			result.append("{\"value\": \"" + locationList.get(i).getLOCATION() + "\"}],");*/
		/*}
		result.append("]}");
		return result.toString();
	}


}

@RequestMapping(value ="/onlinecounsel/expertmb/list_ajax.do")
public ModelAndView list_expertmb_ajax(            //���⼭�� ModelAndView�� ����ϴ°� �߿� ����Ʈ�Դϴ�.
        @ModelAttribute("searchVO") MemberVO searchVO,
        HttpServletRequest request,
        HttpServletResponse response,
        ModelMap model) throws Exception {
    
    String kind = request.getParameter("kind");       //request���� getParameter�� ����Ͽ� kind ���� �ҷ��ɴϴ�.
    
    searchVO.setSite_code(loginService.getSiteCode());
  
    PaginationInfo paginationInfo = new PaginationInfo();
    
    paginationInfo.setCurrentPageNo(searchVO.getPageIndex());        
    paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
    paginationInfo.setPageSize(searchVO.getPageSize());                
    
    searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
    Map<String, Object> map = onlineCounselService.getExpertMbListm(searchVO);        //Map�� �̿��Ͽ� List �� ����¡ ����� �����մϴ�.
    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
    
    paginationInfo.setTotalRecordCount(totCnt);
       
    ModelAndView ajaxList = new ModelAndView("tiles:bsite/onlinecounsel/expertmb/list");      //ajaxList��� ������ ������ ������ �������� ��� ����� ����
    ajaxList.addObject("kind",kind);
    ajaxList.addObject("resultList",map.get("resultList"));
    ajaxList.addObject("resultCnt", map.get("resultCnt"));
    ajaxList.addObject("totalPageCnt", (int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
    ajaxList.addObject("paginationInfo", paginationInfo);
    
    return ajaxList;        // return ���� ���ݴϴ�.
}*/

