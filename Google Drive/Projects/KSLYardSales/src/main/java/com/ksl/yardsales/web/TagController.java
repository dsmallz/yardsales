package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.Tag;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tags")
@Controller
@RooWebScaffold(path = "tags", formBackingObject = Tag.class)
@RooWebJson(jsonObject = Tag.class)
public class TagController {
}
