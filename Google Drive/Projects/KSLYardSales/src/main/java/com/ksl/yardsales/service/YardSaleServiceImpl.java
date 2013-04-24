package com.ksl.yardsales.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.joda.time.TimeOfDay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksl.yardsales.domain.YardSale;
import com.ksl.yardsales.repository.YardSaleRepository;
import com.ksl.yardsales.tasks.YardSaleHtmlParser;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Remark;
import org.htmlparser.Tag;
import org.htmlparser.filters.AndFilter;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.NodeVisitor;


public class YardSaleServiceImpl implements YardSaleService {
	
	final Logger logger = LoggerFactory.getLogger(YardSaleServiceImpl.class);
	final static String kslYardSaleUrl = "http://www.ksl.com/index.php?nid=231&cat=6&category=1&pid=0&viewNumResults=20";
	ArrayList<String> urlListing = new ArrayList<String>();
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<YardSale> findAll() {
		// TODO Auto-generated method stub
		return new ArrayList(yardSaleRepository.findAll());
	}
	@Transactional(readOnly=true)
	public YardSale find(long id) {
		return yardSaleRepository.findOne(id);
	}

	@Override
	public YardSale updateDBWithKSLYardSalesJob() {
		// Update age of cars
		//List<YardSale> yardsales = findAll();
		if(true)
		{
			logger.info("No yardsales exist in the database. Parsing all KSL yardsales.");
			try {
				ArrayList<String> urls = getKSLYardSaleUrls(null);
				for(String url : urls)
				{	
					return getYardSaleDetails(url);
					
				}
			} catch (ParserException e) {
				// TODO Auto-generated catch block
				logger.error("Unable to parse HTML for the KSL Yardsales:" + e.getMessage());
			}
		}	
		else //update with latest KSL -- do not parse entire List from KSL
		{
			return null;
			//TDOO: Only parse to the last known yardsale in the DB
		}
		
		logger.info("Updated DB with latest yardsales from KSL.");
		return null;
	}
	
	private YardSale getYardSaleDetails(String url){
		YardSale yardSale= null;
		try {
			Parser parser = new Parser(url);
			YardSaleHtmlParser visitor = new YardSaleHtmlParser();
			parser.visitAllNodesWith(visitor);
			String[] urlParams = url.split("&");
			Long id = null;
			for(String param : urlParams)
			{
				if(param.contains("ad="))
				{
					String[] temp = param.split("=");
					id = Long.parseLong(temp[1]);
					break;
				}
			}
			yardSale = visitor.getYardSaleObject();
			if(id != null)
			{
				yardSale.setId(id);
			}
			yardSale.setUrl(url);
			yardSale.setDate(new Date());
		
		} catch (ParserException e) {
			logger.error("getYardSaleDetails(): ParseException -Unable to parse HTML from KSL.");
		}
		return yardSale;
	}

	private ArrayList<String> getKSLYardSaleUrls(String url) throws ParserException
	{		
		Parser parser = new Parser(kslYardSaleUrl);
		
		NodeVisitor visitor = new NodeVisitor(){
		
		@Override
		public void visitTag(Tag tag) {
			String name = tag.getTagName();
			logger.info("Tag Name: " + name );
			if (name != null && "div".equalsIgnoreCase(name)) {
				String tagAttr = tag.getAttribute("class");
				logger.info("   Tag Attribute: " + tagAttr);
				if (tagAttr != null && tagAttr.equalsIgnoreCase("listings")) {
					NodeFilter adBoxFilter = new TagNameFilter("DIV");
					NodeList adBoxNodes = null;
					NodeList nodeList = tag.getChildren();
					if (nodeList != null) {
						adBoxNodes = nodeList
								.extractAllNodesThatMatch(adBoxFilter);
					}
					if (adBoxNodes != null && adBoxNodes.size() > 0) {
						try {
							urlListing = parseAdBoxTags(adBoxNodes);
						} catch (ParserException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
				}
			}
		}
		
		private ArrayList<String> parseAdBoxTags(NodeList adBoxes) throws ParserException {
			final ArrayList<String> yardSaleListing = new ArrayList<String>();
			for (int i = 0; i < adBoxes.size(); i++) {
				Node adBox = adBoxes.elementAt(i);
				NodeList nodeList = adBox.getChildren();
				NodeFilter adBoxFilter = new AndFilter(new TagNameFilter(
						"DIV"), new HasAttributeFilter("class")); // moreBox
																	// &&
																	// detailBox
				NodeList adBoxSubNodes = nodeList
						.extractAllNodesThatMatch(adBoxFilter);
				NodeVisitor subVisitor = new NodeVisitor(true) {
				
					@Override
					public void visitTag(Tag tag) {
						String tagText = tag.getText();
						if (tagText.contains("adTitle")) {
							generateAdTitle(tag.getChildren());
						}
					}
					
					private void generateAdTitle(NodeList children) {
						NodeList linkTags = new NodeList();
						NodeClassFilter filter = new NodeClassFilter(
								LinkTag.class);
	
						for (int i = 0; i < children.size(); i++) {
							children.elementAt(i).collectInto(linkTags,
									filter);
						}
	
						LinkTag[] linkTag = new LinkTag[1];
						linkTags.copyToNodeArray(linkTag);
						if (linkTag[0] != null) {
							yardSaleListing.add(linkTag[0].getLink());
						}
					}
				};
				adBoxSubNodes.visitAllNodesWith(subVisitor);
			}
			return yardSaleListing;
		}
		};
		parser.visitAllNodesWith(visitor);	
		return urlListing; 
	}
	
	public YardSale save(YardSale yardSale)
	{
		return yardSaleRepository.save(yardSale);
	}
}