package com.api.rest.contollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.beans.Student;
import com.api.rest.beans.StudentRegistration;

@Controller
public class StudentRetrieveController {
	
	@RequestMapping(method = RequestMethod.GET, value="/student/allstudent")

	@ResponseBody
	public List<Student> getStudent() {
		return StudentRegistration.getInstance().getStudentRecords();
	}

}
