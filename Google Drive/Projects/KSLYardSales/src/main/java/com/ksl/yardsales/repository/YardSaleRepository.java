package com.ksl.yardsales.repository;

import com.ksl.yardsales.domain.YardSale;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = YardSale.class)
public interface YardSaleRepository {
}
