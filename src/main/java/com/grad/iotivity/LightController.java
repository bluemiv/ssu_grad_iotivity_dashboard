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
import org.springframework.web.bind.annotation.RequestMethod;

import com.grad.iotivity.model.LightDAO;
import com.grad.iotivity.model.LightDTO;

@Controller
@RequestMapping("light/")
public class LightController {

	private static final Logger logger = LoggerFactory.getLogger(LightController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("lightForm")
	public String lightForm(Locale locale, Model model) {
		logger.info("LightForm method", locale);
		
		LightDAO lightDAO = sqlSession.getMapper(LightDAO.class);
		LightDTO lightDTO = lightDAO.selectOne();
		
		int hasData = 0;
		if(!(lightDTO.equals(null) || lightDTO == null)) {
			logger.info("[LightForm method] Success to load Data", locale);
			hasData = 1;
		}else {
			logger.info("[LightForm method] Fail to load Data", locale);
		}
		
		model.addAttribute("hasData", hasData);
		model.addAttribute("lightDTO", lightDTO);

		return "light/lightForm";
	}
	
	@RequestMapping(value ="lightInsert", method=RequestMethod.POST)
	public String lightInsert(Locale locale, LightDTO lightDTO) {
		logger.info("Light Data Insert method", locale);
		LightDAO lightDAO = sqlSession.getMapper(LightDAO.class);
		int result = lightDAO.insert(lightDTO);
		if(result == 1) {
			logger.info("Light Insert method : Success to insert Data", locale);	
		}else {
			logger.info("Light Insert method : Fail to insert Data", locale);
		}
		return "redirect:lightForm";
	}
	
	@RequestMapping(value = "lightDelete", method=RequestMethod.POST)
	public String lightDelete(Locale locale, LightDTO lightDTO) {
		logger.info("This is IoTivity Light Dashboard!", locale);
		
		LightDAO lightDAO = sqlSession.getMapper(LightDAO.class);
		int result = lightDAO.delete(lightDTO);
		
		if(result == 1) {
			logger.info("Light Insert method : Success to delete Data", locale);	
		}else {
			logger.info("Light Insert method : Fail to delete Data", locale);
		}
		
		return "redirect:../history/historyLightForm";
	}

	@RequestMapping(value="lightDetailForm", method = RequestMethod.GET)
	public String lightDetailForm(Locale locale, Model model) {
		logger.info("This is IoTivity Light Dashboard!", locale);
		
		LightDAO lightDAO = sqlSession.getMapper(LightDAO.class);
		
		LightDTO lightDTO = lightDAO.selectOne();
		
		int hasData = 0;
		if(!(lightDTO.equals(null) || lightDTO == null)) {
			logger.info("[LightDetailForm 'one' method] Success to load Data", locale);
			hasData = 1;
		}else {
			logger.info("[LightDetailForm 'one' method] Fail to load Data", locale);
		}
		
		ArrayList<LightDTO> list = lightDAO.selectThree();
		
		int hasData2 = 0;
		if(!list.isEmpty()) {
			logger.info("[LightDetailForm 'Three' method] Success to load Data", locale);
			hasData2 = 1;
		}else {
			logger.info("[LightDetailForm 'Three' method] Fail to load Data", locale);
			
		}
		
		model.addAttribute("hasData", hasData);
		model.addAttribute("hasData2", hasData2);
		model.addAttribute("lightList", list);
		model.addAttribute("lightDTO", lightDTO);
		
		return "light/lightDetailForm";
	}
}
