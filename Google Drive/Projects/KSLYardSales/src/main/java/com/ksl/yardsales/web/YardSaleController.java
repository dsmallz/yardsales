package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.YardSale;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/yardsales")
@Controller
@RooWebScaffold(path = "yardsales", formBackingObject = YardSale.class)
@RooWebJson(jsonObject = YardSale.class)
public class YardSaleController {
}
