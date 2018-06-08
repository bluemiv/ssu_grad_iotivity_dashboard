package com.grad.iotivity;

import java.util.ArrayList;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.grad.iotivity.model.LightDAO;
import com.grad.iotivity.model.LightDTO;

@Controller
@RequestMapping("history")
public class HistoryController {

	private static final Logger logger = LoggerFactory.getLogger(HistoryController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("historyForm")
	public String historyForm(Locale locale) {
		logger.info("History Form method", locale);
		
		return "history/historyForm";
	}
	
	@RequestMapping("historyLightForm")
	public String historyLightForm(Locale locale, Model model) {
		logger.info("History Light Form method", locale);
		
		LightDAO lightDAO = sqlSession.getMapper(LightDAO.class);
		ArrayList<LightDTO> lightList = lightDAO.selectAll();
		
		int hasData = 0;
		if(!(lightList.isEmpty())) {
			hasData = 1;
		}
		
		model.addAttribute("lightList", lightList);
		model.addAttribute("hasData", hasData);
		return "history/historyLightForm";
	}
}
