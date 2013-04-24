package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.ContactInfo;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/contactinfoes")
@Controller
@RooWebScaffold(path = "contactinfoes", formBackingObject = ContactInfo.class)
@RooWebJson(jsonObject = ContactInfo.class)
public class ContactInfoController {
}
