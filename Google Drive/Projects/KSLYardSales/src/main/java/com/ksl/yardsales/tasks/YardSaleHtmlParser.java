package com.ksl.yardsales.tasks;

import java.util.ArrayList;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Tag;
import org.htmlparser.Text;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.visitors.NodeVisitor;

import com.ksl.yardsales.domain.YardSale;

public class YardSaleHtmlParser extends NodeVisitor{
	
		YardSale yardSale = new YardSale();

		public YardSaleHtmlParser()
		{
		
		}
		
		@Override
		public void visitStringNode (Text string)
	     {
	         System.out.println (string);
	     }

		
		@Override
		public void visitTag(Tag tag) {
			String name = tag.getTagName();
			
			if (name != null && "div".equalsIgnoreCase(name)) {
				String tagAttr = tag.getAttribute("class");
				if(tagAttr == null)
				{
					//do nothing
				}
				else if (tagAttr.equalsIgnoreCase("productContentTitle")) 
				{
					yardSale.setTitle(tag.getFirstChild().getText());
				}
				else if(tagAttr.equalsIgnoreCase("productContentText"))
				{
					yardSale.setHtmlDescription(tag.toHtml());
					yardSale.setPlainTextDescription(tag.toPlainTextString()); 
				}
				else if(tagAttr.equalsIgnoreCase("productContentLoc"))
				{
					String approximateLocation = tag.getFirstChild().getText(); 
					approximateLocation.trim().replaceAll("&nbsp;", "");
					yardSale.setApproximateLocation(approximateLocation);
					
				}
				else if(tagAttr.equalsIgnoreCase("productContact")) //Need to parse thru children nodes
				{
					NodeList children = tag.getChildren();
					NodeClassFilter filter = new NodeClassFilter(Tag.class);
					NodeList nodeList = children.extractAllNodesThatMatch(filter);
					
					for(int i = 0; i < nodeList.size(); i++)
					{
						Tag contactTag = (Tag)nodeList.elementAt(i);
						String contactTagName = contactTag.getTagName();
						if (name != null && "div".equalsIgnoreCase(contactTagName)) {
							String contactTagAttr = contactTag.getAttribute("class");
							if(contactTagAttr == null)
							{
								//do nothing
							}
							else if(contactTagAttr.equalsIgnoreCase("productContactPhone"))
							{
								yardSale.setContactPhone(contactTag.getFirstChild().getNextSibling().getText()); //TODO: Possible failure point if html changes
							}
							else if (contactTagAttr.equalsIgnoreCase("productContactName")) 
							{
								yardSale.setContactName(contactTag.getFirstChild().getText().trim());
							}
						}
					}
				}
			}
		}

		public YardSale getYardSaleObject() {
			// TODO Auto-generated method stub
			return yardSale;
		}

	
	
	

}
