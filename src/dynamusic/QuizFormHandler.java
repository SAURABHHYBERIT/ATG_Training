package dynamusic;

import java.io.IOException;

import javax.servlet.ServletException;

import atg.droplet.DropletException;
import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class QuizFormHandler extends GenericFormHandler {

	private String question;
	private String answer;
	private String userAnswer;
	private boolean correctAnswer;
	private String validateSuccessURL;
	private String validateErrorURL;

	public String getQuestion() {
		logDebug("Getting question");
		return question;
	}

	public void setQuestion(String question) {
		logDebug("Setting question");
		this.question = question;
	}

	public String getAnswer() {
		logDebug("Getting answer");
		return answer;
	}

	public void setAnswer(String answer) {
		logDebug("Setting answer");
		this.answer = answer;
	}

	public String getUserAnswer() {
		logDebug("Getting userAnswer");
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		logDebug("Setting userAnswer");
		this.userAnswer = userAnswer;
	}

	public boolean isCorrectAnswer() {
		logDebug("Getting correctAnswer");
		return correctAnswer;
	}

	public void setCorrectAnswer(boolean correctAnswer) {
		logDebug("Setting correct answer");
		this.correctAnswer = correctAnswer;
	}

	public String getValidateSuccessURL() {
		logDebug("Getting validateSuccessURL");
		return validateSuccessURL;
	}

	public void setValidateSuccessURL(String validateSuccessURL) {
		logDebug("Setting validateSuccessURL");
		this.validateSuccessURL = validateSuccessURL;
	}

	public String getValidateErrorURL() {
		logDebug("Getting validateErrorURL");
		return validateErrorURL;
	}

	public void setValidateErrorURL(String validateErrorURL) {
		logDebug("Setting validateErrorURL");
		this.validateErrorURL = validateErrorURL;
	}

	public boolean handleValidate(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws java.io.IOException {
		logDebug("Starting validation");
		if (userAnswer.equals("")) {
			logDebug("Error occured, user answer is empty");
			addFormException(new DropletException("Answer cannot be empty"));
			if (getValidateErrorURL() != null) {
				response.sendLocalRedirect(getValidateErrorURL(), request);
				return false;
			}
			logDebug("validateErrorURL is null");
			return true;
		}
		
		logDebug("Validating");
		if (answer.equalsIgnoreCase(userAnswer)) {
			logDebug("Answer correct");
			setCorrectAnswer(true);
		} else {
			logDebug("Answer incorrect");
			setCorrectAnswer(false);
		}
		logDebug("Redirecting to validateSuccessURL");
		if(getValidateSuccessURL() != null){
			response.sendLocalRedirect(getValidateSuccessURL(), request);
			return false;
		}
		logDebug("validateSuccessURL is null");
		
		return true;
	}

	@Override
	public boolean handleCancel(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		logDebug("Canceling QuizForm");
		setUserAnswer(null);
		return super.handleCancel(pRequest, pResponse);
	}

}
