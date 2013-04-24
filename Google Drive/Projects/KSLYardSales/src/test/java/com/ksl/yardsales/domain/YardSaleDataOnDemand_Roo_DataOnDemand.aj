// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.YardSale;
import com.ksl.yardsales.domain.YardSaleDataOnDemand;
import com.ksl.yardsales.repository.YardSaleRepository;
import com.ksl.yardsales.service.YardSaleService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect YardSaleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: YardSaleDataOnDemand: @Component;
    
    private Random YardSaleDataOnDemand.rnd = new SecureRandom();
    
    private List<YardSale> YardSaleDataOnDemand.data;
    
    @Autowired
    YardSaleService YardSaleDataOnDemand.yardSaleService;
    
    @Autowired
    YardSaleRepository YardSaleDataOnDemand.yardSaleRepository;
    
    public YardSale YardSaleDataOnDemand.getNewTransientYardSale(int index) {
        YardSale obj = new YardSale();
        setApproximateLocation(obj, index);
        setContactName(obj, index);
        setContactPhone(obj, index);
        setDate(obj, index);
        setHtmlDescription(obj, index);
        setPlainTextDescription(obj, index);
        setPopularity(obj, index);
        setTitle(obj, index);
        setUrl(obj, index);
        return obj;
    }
    
    public void YardSaleDataOnDemand.setApproximateLocation(YardSale obj, int index) {
        String approximateLocation = "approximateLocation_" + index;
        obj.setApproximateLocation(approximateLocation);
    }
    
    public void YardSaleDataOnDemand.setContactName(YardSale obj, int index) {
        String contactName = "contactName_" + index;
        obj.setContactName(contactName);
    }
    
    public void YardSaleDataOnDemand.setContactPhone(YardSale obj, int index) {
        String contactPhone = "contactPhone_" + index;
        obj.setContactPhone(contactPhone);
    }
    
    public void YardSaleDataOnDemand.setDate(YardSale obj, int index) {
        Date date = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDate(date);
    }
    
    public void YardSaleDataOnDemand.setHtmlDescription(YardSale obj, int index) {
        String htmlDescription = "htmlDescription_" + index;
        obj.setHtmlDescription(htmlDescription);
    }
    
    public void YardSaleDataOnDemand.setPlainTextDescription(YardSale obj, int index) {
        String plainTextDescription = "plainTextDescription_" + index;
        obj.setPlainTextDescription(plainTextDescription);
    }
    
    public void YardSaleDataOnDemand.setPopularity(YardSale obj, int index) {
        int popularity = index;
        obj.setPopularity(popularity);
    }
    
    public void YardSaleDataOnDemand.setTitle(YardSale obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public void YardSaleDataOnDemand.setUrl(YardSale obj, int index) {
        String url = "url_" + index;
        obj.setUrl(url);
    }
    
    public YardSale YardSaleDataOnDemand.getSpecificYardSale(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        YardSale obj = data.get(index);
        Long id = obj.getId();
        return yardSaleService.findYardSale(id);
    }
    
    public YardSale YardSaleDataOnDemand.getRandomYardSale() {
        init();
        YardSale obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return yardSaleService.findYardSale(id);
    }
    
    public boolean YardSaleDataOnDemand.modifyYardSale(YardSale obj) {
        return false;
    }
    
    public void YardSaleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = yardSaleService.findYardSaleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'YardSale' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<YardSale>();
        for (int i = 0; i < 10; i++) {
            YardSale obj = getNewTransientYardSale(i);
            try {
                yardSaleService.saveYardSale(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            yardSaleRepository.flush();
            data.add(obj);
        }
    }
    
}
