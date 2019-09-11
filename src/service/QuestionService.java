package service;

import java.util.List;

import javaBean.Question;

public interface QuestionService {

	List<Question> findQuestionsByPaperId(int paperId);
	int addQuestions(Question question);
}
