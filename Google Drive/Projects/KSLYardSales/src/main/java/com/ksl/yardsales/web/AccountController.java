package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.Account;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/accounts")
@Controller
@RooWebScaffold(path = "accounts", formBackingObject = Account.class)
@RooWebJson(jsonObject = Account.class)
public class AccountController {
}
