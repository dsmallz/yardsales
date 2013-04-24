package com.ksl.yardsales.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import com.ksl.yardsales.domain.YardSale;

@RooService(domainTypes = { com.ksl.yardsales.domain.YardSale.class })
public interface YardSaleService {
	public List<YardSale> findAll();
	public YardSale updateDBWithKSLYardSalesJob();
	public YardSale save(YardSale yardSale);
}
