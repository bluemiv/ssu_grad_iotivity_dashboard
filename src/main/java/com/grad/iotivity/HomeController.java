package com.grad.iotivity;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.grad.iotivity.model.LightDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping("/home")
	public String home(Locale locale, Model model, LightDTO lightDTO) {
		logger.info("This is IoTivity Light Dashboard!", locale);
		
//        CoapClient client = new CoapClient("coap://192.168.56.1:13032/a/light");
        
//        String content1 = client.get().getResponseText();
//        System.out.println("Response : " + content1);
		
//		model.addAttribute("");
		return "homeList";
	}

}
