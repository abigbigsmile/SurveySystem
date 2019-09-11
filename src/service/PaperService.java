package service;

import java.util.List;

import javaBean.Paper;

public interface PaperService {
	
	List<Paper> findAllPapers();
	List<Paper> findPaperByUserId(int userId);
	List<Paper> findPaperByPaperType(int paperType);
	
	Paper findPaperByPaperId(int paperId);
	int   findPaperIdByuserIdAndDate(int userId,String paperStartDate);
//	Paper showResultByPaperId(int paperId);
	
	int addPapers(Paper paper);
	int deletePaperByPaperId(int paperId);
	int deletePaperByUserId(int userId);
	
}