// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.Tag;
import com.ksl.yardsales.domain.YardSale;
import com.ksl.yardsales.service.YardSaleService;
import com.ksl.yardsales.web.YardSaleController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect YardSaleController_Roo_Controller {
    
    @Autowired
    YardSaleService YardSaleController.yardSaleService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String YardSaleController.create(@Valid YardSale yardSale, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, yardSale);
            return "yardsales/create";
        }
        uiModel.asMap().clear();
        yardSaleService.saveYardSale(yardSale);
        return "redirect:/yardsales/" + encodeUrlPathSegment(yardSale.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String YardSaleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new YardSale());
        return "yardsales/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String YardSaleController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("yardsale", yardSaleService.findYardSale(id));
        uiModel.addAttribute("itemId", id);
        return "yardsales/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String YardSaleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("yardsales", yardSaleService.findYardSaleEntries(firstResult, sizeNo));
            float nrOfPages = (float) yardSaleService.countAllYardSales() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("yardsales", yardSaleService.findAllYardSales());
        }
        addDateTimeFormatPatterns(uiModel);
        return "yardsales/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String YardSaleController.update(@Valid YardSale yardSale, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, yardSale);
            return "yardsales/update";
        }
        uiModel.asMap().clear();
        yardSaleService.updateYardSale(yardSale);
        return "redirect:/yardsales/" + encodeUrlPathSegment(yardSale.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String YardSaleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, yardSaleService.findYardSale(id));
        return "yardsales/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String YardSaleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        YardSale yardSale = yardSaleService.findYardSale(id);
        yardSaleService.deleteYardSale(yardSale);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/yardsales";
    }
    
    void YardSaleController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("yardSale_date_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void YardSaleController.populateEditForm(Model uiModel, YardSale yardSale) {
        uiModel.addAttribute("yardSale", yardSale);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tags", Tag.findAllTags());
    }
    
    String YardSaleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
