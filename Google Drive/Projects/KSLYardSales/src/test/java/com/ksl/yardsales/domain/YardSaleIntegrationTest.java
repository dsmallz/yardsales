package com.ksl.yardsales.domain;

import java.util.ArrayList;
import java.util.Date;

import junit.framework.Assert;

import org.htmlparser.util.ParserException;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.transaction.annotation.Transactional;

import com.ksl.yardsales.service.YardSaleService;
import com.ksl.yardsales.service.YardSaleServiceImpl;

@RooIntegrationTest(entity = YardSale.class)
public class YardSaleIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    @Transactional
    public void addAndFetchYardSaleViaRepo() {
    YardSale s = new YardSale();
   
    s.setTitle("YardSaleTest1");
    s.setPlainTextDescription("You'll laugh, you'll cry, it will become a part of you.");
    s.setDate(new Date());
    s.setPopularity(10);
    s.setUrl("http:\\www.ksl.com");
    
    yardSaleRepository.saveAndFlush(s);
    s.clear();
    Assert.assertNotNull(s.getId());
    YardSale s2 = yardSaleRepository.findOne(s.getId());
    Assert.assertNotNull(s2);
    Assert.assertEquals(s.getTitle(), s2.getTitle());
    Assert.assertEquals(s2.getPlainTextDescription(), s.getPlainTextDescription());
    Assert.assertEquals(s.getDate(), s2.getDate());
    Assert.assertEquals(s.getPopularity(), s2.getPopularity());
    }
    
    @Test
    @Transactional
    public void testPersistTagsInYardSales() {
	    YardSaleDataOnDemand yardsaleDod = new YardSaleDataOnDemand();
	    YardSale yardSale = yardsaleDod.getNewTransientYardSale(0);
	    yardSale.setTitle("YardSale 1");
	    TagDataOnDemand tagDod = new TagDataOnDemand();
	    Tag t1 = tagDod.getNewTransientTag(0);
	    Tag t2 = tagDod.getNewTransientTag(1);
	    yardSale.getTags().add(t1);
	    yardSale.getTags().add(t2);
	    t1.getYardsales().add(yardSale);
	    t2.getYardsales().add(yardSale);
	    t1.persist();
	    t2.persist();
	    t2.flush();
	    t2.clear();
	    Assert.assertEquals(2,YardSale.findYardSale(yardSale.getId()).getTags().size());
    }
    
    @Test
    public void testParseHtmlFromKSL() throws ParserException {
    	
    	YardSaleService y = new YardSaleServiceImpl();
    	YardSale yardSale = y.updateDBWithKSLYardSalesJob();
    	
    	YardSaleDataOnDemand yardsaleDod = new YardSaleDataOnDemand();
	    YardSale fakeYardSale = yardsaleDod.getNewTransientYardSale(0);
	    
	    fakeYardSale.setTitle(yardSale.getTitle());
	    fakeYardSale.setPlainTextDescription(yardSale.getPlainTextDescription());
	    
	    fakeYardSale.persist();
	    fakeYardSale.flush();
	    fakeYardSale.clear();
	    
	    YardSale yardSaleFromDB = YardSale.findYardSale(yardSale.getId());
	    
	    Assert.assertNotNull(YardSale.findYardSale(fakeYardSale.getId()));
    	Assert.assertTrue("Yard Sale Count: " + YardSale.countYardSales(), YardSale.countYardSales() > 0);
    	
//    	System.out.println("URL Listing Size: " + urlListing.size());
    }
 
}